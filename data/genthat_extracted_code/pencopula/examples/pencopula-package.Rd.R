library(pencopula)


### Name: pencopula-package
### Title: The package 'pencopula' offers routines for estimating
###   multivariate penalized copula densities and copula distribution.
### Aliases: pencopula-package
### Keywords: nonparametric

### ** Examples

Y <- cbind(runif(200),runif(200))
plot(pencopula(Y,d=4,D=4,lambda=rep(10,2),base="B-spline"))



