library(cvxbiclustr)


### Name: convert
### Title: Convert weights, as COO matrix, to CSC matrix and weights vector
### Aliases: convert

### ** Examples

W <- matrix(0,3,3)
W[1,] <- c(1,2,1)
W[2,] <- c(1,3,2)
W[3,] <- c(2,3,3)

sol <- convert(W)



