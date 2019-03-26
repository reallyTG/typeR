library(sparseinv)


### Name: cholsolve
### Title: Solve the equation Qx = y
### Aliases: cholsolve
### Keywords: Cholesky factor, linear solve

### ** Examples

require(Matrix)
Q = sparseMatrix(i = c(1, 1, 2, 2),
                 j = c(1, 2, 1, 2),
                 x = c(0.1, 0.2, 0.2, 1))
y = matrix(c(1, 2), 2, 1)
cholsolve(Q, y)



