library(sudokuAlt)


### Name: solveGame
### Title: Solve a Sudoku Game
### Aliases: solveGame

### ** Examples

set.seed(1234)
makeGame(3, gaps = 60) %>% solve %>% plot -> sg
(g <- originalGame(sg))

g <- emptyGame(4)  # construct a patterned game
diag(g) <- LETTERS[1:16]
sg <- solve(g)
plot(sg)



