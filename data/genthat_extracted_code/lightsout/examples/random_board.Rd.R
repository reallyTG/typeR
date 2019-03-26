library(lightsout)


### Name: random_board
### Title: Create a random (but solvable) Lights Out board
### Aliases: random_board

### ** Examples

set.seed(10)

# Create a random 5x5 classic board
board <- random_board(5)
board

# Get the solution for the board
solution <- solve_board(board)
solution

# Press the lights according to the solution, the result should be a board
# with all lights switched off
play(board, matrix = solution)



