library(limSolve)


### Name: nnls
### Title: Nonnegative Least Squares
### Aliases: nnls
### Keywords: algebra array optimize

### ** Examples

A <- matrix(nrow = 2, ncol = 3, data = c(3, 2, 2, 4, 2, 1))
B <- c(-4, 3)
nnls(A, B)



