library(DepthProc)


### Name: scaleCurve
### Title: Scale curve
### Aliases: scaleCurve
### Keywords: curve depth function multivariate nonparametric robust scale

### ** Examples

library(mvtnorm)
x <- mvrnorm(n = 100, mu = c(0, 0), Sigma = 3 * diag(2))
y <- rmvt(n = 100, sigma = diag(2), df = 2)
scaleCurve(x, y, depth_params = list(method = "Projection"))
# Comparing two scale curves
# normal distribution and mixture of normal distributions
x <- mvrnorm(100, c(0, 0), diag(2))
y <- mvrnorm(80, c(0, 0), diag(2))
z <- mvrnorm(20, c(5, 5), diag(2))
scaleCurve(x, rbind(y, z), name = "N", name_y = "Mixture of N",
           depth_params = list(method = "Projection"))




