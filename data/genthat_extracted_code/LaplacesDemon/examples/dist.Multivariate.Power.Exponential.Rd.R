library(LaplacesDemon)


### Name: dist.Multivariate.Power.Exponential
### Title: Multivariate Power Exponential Distribution
### Aliases: dmvpe rmvpe
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
n <- 100
k <- 3
x <- matrix(runif(n*k),n,k)
mu <- matrix(runif(n*k),n,k)
Sigma <- diag(k)
dmvpe(x, mu, Sigma, kappa=1)
X <- rmvpe(n, mu, Sigma, kappa=1)
joint.density.plot(X[,1], X[,2], color=TRUE)



