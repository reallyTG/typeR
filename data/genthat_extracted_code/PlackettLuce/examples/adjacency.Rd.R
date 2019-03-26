library(PlackettLuce)


### Name: adjacency
### Title: Create an Adjacency Matrix for a set of Rankings
### Aliases: adjacency

### ** Examples

X <- matrix(c(2, 1, 2, 1, 2,
              3, 2, 0, 0, 1,
              1, 0, 2, 2, 3), nrow = 3, byrow = TRUE)
X <- as.rankings(X)
adjacency(X)

adjacency(X, weights = c(1, 1, 2))




