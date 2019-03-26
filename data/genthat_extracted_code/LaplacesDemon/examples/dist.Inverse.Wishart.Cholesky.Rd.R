library(LaplacesDemon)


### Name: dist.Inverse.Wishart.Cholesky
### Title: Inverse Wishart Distribution: Cholesky Parameterization
### Aliases: dinvwishartc rinvwishartc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
Sigma <- matrix(c(2,-.3,-.3,4),2,2)
U <- chol(Sigma)
x <- dinvwishartc(U, 3, matrix(c(1,.1,.1,1),2,2))
x <- rinvwishartc(3, matrix(c(1,.1,.1,1),2,2))



