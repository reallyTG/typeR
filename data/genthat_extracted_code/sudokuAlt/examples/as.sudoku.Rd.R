library(sudokuAlt)


### Name: as.sudoku
### Title: Generic Sudoku Game Constructor
### Aliases: as.sudoku

### ** Examples

M <- as.sudoku(matrix("", 16, 16))
M[1:4, 1:4] <- matrix(LETTERS[1:16], 4, 4, byrow = TRUE)
sM <- solve(M)
plot(sM)



