library(lightsout)


### Name: solve_board
### Title: Solve a Lights Out board
### Aliases: solve_board

### ** Examples

# Create an empty 5x5 board, press two lights, and then see that the solution
# tells us to press the same lights in order to solve the board.
board <- empty_board(5) %>% play(3, 2) %>% play(4, 1)
board
solution <- solve_board(board)
solution
board <- play(board, matrix = solution)
is_solved(board)



