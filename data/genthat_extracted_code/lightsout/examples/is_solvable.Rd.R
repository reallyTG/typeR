library(lightsout)


### Name: is_solvable
### Title: Is a given Lights Out board solvable?
### Aliases: is_solvable

### ** Examples

# The following board is solvable using the classic mode (only adjacent lights
# are toggled), but has no solution in the variant mode.
lights <- c(1, 1, 0,
            1, 0, 0,
            0, 0, 0 )
board_classic <- new_board(lights)
board_variant <- new_board(lights, classic = FALSE)
is_solvable(board_classic)
is_solvable(board_variant)



