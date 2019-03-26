library(JacobiEigen)


### Name: Jacobi
### Title: The Jacobi Algorithm using Rcpp
### Aliases: Jacobi

### ** Examples

V <- crossprod(matrix(runif(40, -1, 1), 8))
Jacobi(V)
identical(Jacobi(V), JacobiR(V))
all.equal(Jacobi(V)$values, base::eigen(V)$values)



