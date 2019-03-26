library(lightsout)


### Name: is_solved
### Title: Is the given board is a solved state?
### Aliases: is_solved

### ** Examples

# Create a board solved with one move and solve it.
lights <- c(1, 1, 0,
            1, 0, 0,
            0, 0, 0 )
board <- new_board(lights)
is_solved(board)
board <- board %>% play(1, 1)
is_solved(board)



