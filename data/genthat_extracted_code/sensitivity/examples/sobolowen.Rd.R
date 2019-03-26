library(sensitivity)


### Name: sobolowen
### Title: Monte Carlo Estimation of Sobol' Indices (improved formulas of
###   Owen (2013)
### Aliases: sobolowen tell.sobolowen print.sobolowen plot.sobolowen
### Keywords: design

### ** Examples

# Test case : the non-monotonic Sobol g-function

# The method of sobolowen requires 3 samples
# There are 8 factors, all following the uniform distribution
# on [0,1]

library(boot)
n <- 1000
X1 <- data.frame(matrix(runif(8 * n), nrow = n))
X2 <- data.frame(matrix(runif(8 * n), nrow = n))
X3 <- data.frame(matrix(runif(8 * n), nrow = n))

# sensitivity analysis

## No test: 
x <- sobolowen(model = sobol.fun, X1, X2, X3, nboot = 100)
print(x)
plot(x)
## End(No test)



