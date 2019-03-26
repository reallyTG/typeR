library(sparseinv)


### Name: cholsolveAQinvAT
### Title: Solve the equation X = AQ^-1t(A) under permutations
### Aliases: cholsolveAQinvAT
### Keywords: Cholesky factor, linear solve

### ** Examples

require(Matrix)
Q = sparseMatrix(i = c(1, 1, 2, 2),
                 j = c(1, 2, 1, 2),
                 x = c(0.1, 0.2, 0.2, 1))
X <- cholPermute(Q)
y <- matrix(c(1,2), 2, 1)
A <- y %*% t(y)
cholsolveAQinvAT(Q,A,X$Qpermchol,X$P)



