library(LaplacesDemon)


### Name: dist.Normal.Wishart
### Title: Normal-Wishart Distribution
### Aliases: dnormwishart rnormwishart
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
K <- 3
mu <- rnorm(K)
mu0 <- rnorm(K)
nu <- K + 1
S <- diag(K)
lambda <- runif(1) #Real scalar
Omega <- as.positive.definite(matrix(rnorm(K^2),K,K))
x <- dnormwishart(mu, mu0, lambda, Omega, S, nu, log=TRUE)
out <- rnormwishart(n=10, mu0, lambda, S, nu)
joint.density.plot(out$mu[,1], out$mu[,2], color=TRUE)



