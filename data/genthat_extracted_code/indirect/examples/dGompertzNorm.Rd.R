library(indirect)


### Name: dGompertzNorm
### Title: density for Gompertz transformed univariate Gaussian
### Aliases: dGompertzNorm

### ** Examples

mu <- -1
sigma <- 1
z <- rnorm(10000, mu, sigma)
hist(1 - exp(-exp(z)), freq = FALSE)
curve(dGompertzNorm(x, mu = mu, sigma = sigma), col = 'red', add = TRUE, from = 0.01, to = 0.99)
integrate(function(x) dGompertzNorm(x, mu = mu, sigma = sigma), lower = 0, upper = 1) # equals 1



