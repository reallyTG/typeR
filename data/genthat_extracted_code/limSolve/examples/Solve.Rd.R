library(limSolve)


### Name: Solve
### Title: Generalised inverse solution of Ax = B
### Aliases: Solve
### Keywords: array

### ** Examples

A <- matrix(nrow = 4, ncol = 3, data = c(1:8, 6, 8, 10, 12)) # col3 = col1+col2
B <- 0:3
X <- Solve(A, B)            # generalised inverse solution
A %*% X - B                 # should be zero (except for roundoff)
(gA <- Solve(A))           # generalised inverse of A



