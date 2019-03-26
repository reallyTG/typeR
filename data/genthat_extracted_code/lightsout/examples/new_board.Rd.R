library(lightsout)


### Name: new_board
### Title: Initialize a Lights Out board with a given lights configuration
### Aliases: new_board

### ** Examples

vector <- c(1, 1, 0,
            1, 0, 1,
            0, 1, 1)
new_board(entries = vector)

matrix <- matrix(
            c(1, 1, 0,
              1, 0, 1,
              0, 1, 1),
            nrow = 3, byrow = TRUE)
new_board(entries = matrix)



