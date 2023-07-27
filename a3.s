.global _start
_start:
    MOV R0, #22     // Store the inmediate value 22 in R0
    MOV R1, #42     // Store the inmediate value 42 in R1
    MOV R5, #15     // Store the inmediate value 15 in R5

    CMP R0, R1      // Compare the values in R0 and R1
    BGT greater     // Branch to "greater" label if RO > R1
    BLT lesser      // Branch to "lesser" label if R0 < R1
    BEQ equaler     // Branch to "equaler" label if R0 == R1

exit_0:             // Exit label to avoid repeating the exit sequence
    MOV R0, #0
    MOV R7, #1
    SWI 0

greater:
    LSL R5, #2      // Shift bits to the left 2 times (multiply by 2^2)
    BAL exit_0

lesser:
    LSR R5, #1      // Shift bits to the right 1 time (divide by 2^1)
    BAL exit_0

equaler:
    ROR R5, #1      // Rotate the bits to the right 1 time (Similar to shifting, but without losing data)
    BAL exit_0

