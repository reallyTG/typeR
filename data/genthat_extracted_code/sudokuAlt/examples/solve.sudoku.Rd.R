library(sudokuAlt)


### Name: solve.sudoku
### Title: Solve a Sudoku Puzzle
### Aliases: solve.sudoku

### ** Examples

set.seed(1234)
makeGame(3, gaps = 59) %>% solve %>% plot -> sg
originalGame(sg)

g <- emptyGame(4)  # construct a patterned game
diag(g) <- LETTERS[1:16]
g %>% solve %>% plot -> sg
sg



