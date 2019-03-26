library(LaplacesDemon)


### Name: dist.Multivariate.Power.Exponential.Cholesky
### Title: Multivariate Power Exponential Distribution: Cholesky
###   Parameterization
### Aliases: dmvpec rmvpec
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
n <- 100
k <- 3
x <- matrix(runif(n*k),n,k)
mu <- matrix(runif(n*k),n,k)
Sigma <- diag(k)
U <- chol(Sigma)
dmvpec(x, mu, U, kappa=1)
X <- rmvpec(n, mu, U, kappa=1)
joint.density.plot(X[,1], X[,2], color=TRUE)



