library(sensitivity)


### Name: sobol
### Title: Monte Carlo Estimation of Sobol' Indices
### Aliases: sobol tell.sobol print.sobol plot.sobol
### Keywords: design

### ** Examples

# Test case : the non-monotonic Sobol g-function

# The method of sobol requires 2 samples
# (there are 8 factors, all following the uniform distribution on [0,1])
library(boot)
n <- 1000
X1 <- data.frame(matrix(runif(8 * n), nrow = n))
X2 <- data.frame(matrix(runif(8 * n), nrow = n))

# sensitivity analysis
x <- sobol(model = sobol.fun, X1 = X1, X2 = X2, order = 2, nboot = 100)
print(x)
#plot(x)



