library(sensitivity)


### Name: sobolEff
### Title: Monte Carlo Estimation of Sobol' Indices (formulas of
###   Janon-Monod)
### Aliases: sobolEff tell.sobolEff print.sobolEff plot.sobolEff
### Keywords: design

### ** Examples

# Test case : the non-monotonic Sobol g-function

# The method of sobol requires 2 samples
# (there are 8 factors, all following the uniform distribution on [0,1])
n <- 1000
X1 <- data.frame(matrix(runif(8 * n), nrow = n))
X2 <- data.frame(matrix(runif(8 * n), nrow = n))

# sensitivity analysis
x <- sobolEff(model = sobol.fun, X1 = X1, X2 = X2, nboot = 0)
print(x)



