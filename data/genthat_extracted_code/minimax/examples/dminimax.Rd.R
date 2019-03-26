library(minimax)


### Name: minimax
### Title: Minimax distribution family
### Aliases: minimax dminimax pminimax qminimax rminimax
### Keywords: distribution

### ** Examples

p <- pminimax(0:10/10, 1:5, 2)
q <- qminimax(p, 1:5, 2)
(d <- dminimax(matrix(0.5, 2, 2), 1:4, 2:3))

set.seed(123)
(r <- rminimax(letters, 2, 3))



