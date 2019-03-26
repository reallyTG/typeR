library(indirect)


### Name: dLogitNorm
### Title: density for logit transformed univariate Gaussian
### Aliases: dLogitNorm

### ** Examples

mu <- -1
sigma <- 1
z <- rnorm(10000, mu, sigma)
hist(exp(z)/(1 + exp(z)), freq = FALSE)
curve(dLogitNorm(x, mu = mu, sigma = sigma), col = 'red', add = TRUE, from = 0.01, to = 0.99)
integrate(function(x) dLogitNorm(x, mu = mu, sigma = sigma), lower = 0, upper = 1) # equals 1



