library(LaplacesDemon)


### Name: dist.Wishart.Cholesky
### Title: Wishart Distribution: Cholesky Parameterization
### Aliases: dwishartc rwishartc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
Omega <- matrix(c(2,-.3,-.3,4),2,2)
U <- chol(Omega)
x <- dwishartc(U, 3, matrix(c(1,.1,.1,1),2,2))
x <- rwishartc(3, matrix(c(1,.1,.1,1),2,2))



