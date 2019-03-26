library(sudokuAlt)


### Name: seedGame
### Title: Starting Point to Make a Random Sudoku Game
### Aliases: seedGame

### ** Examples

set.seed(2345)
g <- seedGame(3)
sg <- solve(g) ## a completed random game
plot(sg)



