library(JacobiEigen)


### Name: JacobiR
### Title: The Jacobi Algorithm in Pure R
### Aliases: JacobiR

### ** Examples

V <- crossprod(matrix(rnorm(25), 5))
JacobiR(V)
identical(Jacobi(V), JacobiR(V))
all.equal(Jacobi(V)$values, base::eigen(V)$values)



