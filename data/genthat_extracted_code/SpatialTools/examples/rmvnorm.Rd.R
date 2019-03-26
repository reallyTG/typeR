library(SpatialTools)


### Name: rmvnorm
### Title: Generates realizations from a multivariate normal distribution
### Aliases: rmvnorm
### Keywords: normal multivariate

### ** Examples

n <- 20
mu <- 1:n
V <- exp(-dist1(matrix(rnorm(n))))
rmvnorm(nsim = 100, mu = mu, V = V, method = "eigen")



