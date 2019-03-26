library(sensitivity)


### Name: sobolmara
### Title: Monte Carlo Estimation of Sobol' Indices via matrix permutations
### Aliases: sobolmara tell.sobolmara print.sobolmara plot.sobolmara
### Keywords: design

### ** Examples

# Test case : the non-monotonic Sobol g-function

# The method of sobolmara requires 1 sample
# (there are 8 factors, all following the uniform distribution on [0,1])
n <- 1000
X1 <- data.frame(matrix(runif(8 * n), nrow = n))

# sensitivity analysis
x <- sobolmara(model = sobol.fun, X1 = X1)
print(x)
plot(x)



