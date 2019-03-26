library(lightsout)


### Name: play
### Title: Play (press) a single light or multiple lights on a board
### Aliases: play

### ** Examples

# Create a 5x5 board with all lights switched off and then press some lights

board <- empty_board(5)
board

# Press the light at (2,1)
newboard <- play(board, 2, 1)
newboard

# Press the light at (2,1) and then at (3,4)
newboard <- board %>% play(2, 1) %>% play(3, 4)
newboard

# Press both lights with one call
newboard <- play(board, c(2, 3), c(1, 4))
newboard

# Press both lights using a matrix instead of specifying rows and columns
newboard <- play(board, matrix = matrix(
                          c(0, 0, 0, 0, 0,
                            1, 0, 0, 0, 0,
                            0, 0, 0, 1, 0,
                            0, 0, 0, 0, 0,
                            0, 0, 0, 0, 0),
                          nrow = 5, byrow = TRUE))
newboard

# Press the same lights, but this time when the game mode is not classic,
# and the whole row/column get toggled
empty_board(5, classic = FALSE) %>% play(2, 1)
empty_board(5, classic = FALSE) %>% play(c(2, 3), c(1, 4))



