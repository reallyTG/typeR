library(sensitivity)


### Name: sobol2002
### Title: Monte Carlo Estimation of Sobol' Indices (scheme by Saltelli
###   2002)
### Aliases: sobol2002 tell.sobol2002 print.sobol2002 plot.sobol2002
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

x <- sobol2002(model = sobol.fun, X1, X2, nboot = 100)
print(x)
plot(x)



