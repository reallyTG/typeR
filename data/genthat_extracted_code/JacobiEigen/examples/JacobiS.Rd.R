library(JacobiEigen)


### Name: JacobiS
### Title: The Jacobi Algorithm using Rcpp with a stagewise rotation
###   protocol
### Aliases: JacobiS

### ** Examples

V <- crossprod(matrix(runif(40, -1, 1), 8))
JacobiS(V)
all.equal(JacobiS(V)$values, Jacobi(V)$values)
zapsmall(crossprod(JacobiS(V)$vectors, Jacobi(V)$vectors))



