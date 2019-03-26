library(sensitivity)


### Name: soboltouati
### Title: Monte Carlo Estimation of Sobol' Indices (formulas of Martinez
###   (2011) and Touati (2016))
### Aliases: soboltouati tell.soboltouati print.soboltouati
###   plot.soboltouati
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

x <- soboltouati(model = sobol.fun, X1, X2)
print(x)
plot(x)



