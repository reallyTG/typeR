library(mcmcse)


### Name: mcse
### Title: Compute Monte Carlo standard errors for expectations.
### Aliases: mcse

### ** Examples

# Create 10,000 iterations of an AR(1) Markov chain with rho = 0.9.

n = 10000
x = double(n)
x[1] = 2
for (i in 1:(n - 1))
    x[i + 1] = 0.9 * x[i] + rnorm(1)

# Estimate the mean, 0.1 quantile, and 0.9 quantile with MCSEs using batch means.

mcse(x)
mcse.q(x, 0.1)
mcse.q(x, 0.9)

# Estimate the mean, 0.1 quantile, and 0.9 quantile with MCSEs using overlapping batch means.

mcse(x, method = "obm")
mcse.q(x, 0.1, method = "obm")
mcse.q(x, 0.9, method = "obm")

# Estimate E(x^2) with MCSE using spectral methods.

g = function(x) { x^2 }
mcse(x, g = g, method = "tukey")



