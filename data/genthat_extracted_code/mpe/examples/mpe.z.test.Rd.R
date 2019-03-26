library(mpe)


### Name: mpe.z.test
### Title: Intersection-Union z-Test for Testing Multiple Co-Primary
###   Endpoints
### Aliases: mpe.z.test
### Keywords: htest multivariate

### ** Examples

delta <- c(0.25, 0.5)
Sigma <- matrix(c(1, 0.75, 0.75, 1), ncol = 2)
n <- 50
X <- rmvnorm(n=n, mean = delta, sigma = Sigma)
Y <- rmvnorm(n=n, mean = rep(0, length(delta)), sigma = Sigma)
mpe.z.test(X = X, Y = Y, Sigma = Sigma)



