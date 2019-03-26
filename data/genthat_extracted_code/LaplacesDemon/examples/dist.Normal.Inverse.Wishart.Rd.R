library(LaplacesDemon)


### Name: dist.Normal.Inverse.Wishart
### Title: Normal-Inverse-Wishart Distribution
### Aliases: dnorminvwishart rnorminvwishart
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
K <- 3
mu <- rnorm(K)
mu0 <- rnorm(K)
nu <- K + 1
S <- diag(K)
lambda <- runif(1) #Real scalar
Sigma <- as.positive.definite(matrix(rnorm(K^2),K,K))
x <- dnorminvwishart(mu, mu0, lambda, Sigma, S, nu, log=TRUE)
out <- rnorminvwishart(n=10, mu0, lambda, S, nu)
joint.density.plot(out$mu[,1], out$mu[,2], color=TRUE)



