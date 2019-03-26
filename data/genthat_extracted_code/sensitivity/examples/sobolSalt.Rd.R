library(sensitivity)


### Name: sobolSalt
### Title: Monte Carlo Estimation of Sobol' Indices based on Saltelli
###   schemes
### Aliases: sobolSalt tell.sobolSalt print.sobolSalt plot.sobolSalt
### Keywords: design

### ** Examples

# Test case : the non-monotonic Sobol g-function

# The method of sobol requires 2 samples
# There are 8 factors, all following the uniform distribution
# on [0,1]

library(boot)
n <- 1000
X1 <- data.frame(matrix(runif(8 * n), nrow = n))
X2 <- data.frame(matrix(runif(8 * n), nrow = n))

# sensitivity analysis

x <- sobolSalt(model = sobol.fun, X1, X2, scheme="A", nboot = 100)
print(x)
plot(x, choice=1)



