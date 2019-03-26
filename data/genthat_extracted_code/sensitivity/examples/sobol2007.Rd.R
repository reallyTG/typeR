library(sensitivity)


### Name: sobol2007
### Title: Monte Carlo Estimation of Sobol' Indices (improved formulas of
###   Mauntz: Sobol et al. (2007) and Saltelli et al. (2010))
### Aliases: sobol2007 tell.sobol2007 print.sobol2007 plot.sobol2007
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

x <- sobol2007(model = sobol.fun, X1, X2, nboot = 100)
print(x)
plot(x)



