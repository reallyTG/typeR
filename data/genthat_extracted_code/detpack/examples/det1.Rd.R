library(detpack)


### Name: det1
### Title: Density Estimation for Univariate Data Based on Distribution
###   Element Trees
### Aliases: det1

### ** Examples

require(stats)
det1(rbeta(5e5, shape1 = 1.05, shape2 = 0.8), mode = -1,
     bounds = c(-0.1,1.1), main = "beta, const. elements, equal-scores splits")
x <- seq(-0.1,1.1,0.005); lines(x, dbeta(x,shape1 = 1.05,shape2 = 0.8), col = "red")
det1(rbeta(5e5, shape1 = 1.05, shape2 = 0.8), mode = -2,
     bounds = c(-0.1,1.1), main = "beta, linear elements, equal-scores splits")
x <- seq(-0.1,1.1,0.005); lines(x, dbeta(x,shape1 = 1.05,shape2 = 0.8), col = "red")
det1(rnorm(5e5), mode = 2, cores = 1, main = "Gaussian, linear elements, equal-size splits")
x <- seq(-5,5,0.05); lines(x, dnorm(x), col = "red")
det1(runif(5e5), mode = 1, bounds = c(-0.1,1.1),
     main = "uniform, const. elements, equal-size splits")
x <- seq(-0.1,1.1,0.005); lines(x, dunif(x), col = "red")



