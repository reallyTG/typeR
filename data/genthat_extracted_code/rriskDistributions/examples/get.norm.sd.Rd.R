library(rriskDistributions)


### Name: get.norm.sd
### Title: Fitting standard deviation of a normal distribution from one or
###   more quantiles and known mean
### Aliases: get.norm.sd
### Keywords: fitpercentiles

### ** Examples

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 0, sd = 2)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, scaleX = c(0.0001, 0.9999))
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 10, 1))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
get.norm.sd(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 176, sd = 15)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 10, 1))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
get.norm.sd(q = q, fit.weights = c(1, 100, 1))
graphics::par(old.par)

## The estimation model is not suitable for the following quantiles.
## Because the quantile is unsymmetrical, which could not be from a normally distributed data.
q <- c(-2, 30, 31)
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 10, 1), scaleX = c(0.0001, 0.9999))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
get.norm.sd(q = q, fit.weights = c(1, 100, 1), scaleX = c(0.0001, 0.9999))
graphics::par(old.par)

## Estimating from actually exponentially distributed data
x.exp <- rexp(n = 10, rate = 5)
mean(x.exp)
stats::sd(x.exp)
q <- quantile(x.exp, c(0.025, 0.5, 0.975))
old.par <- graphics::par(mfrow = c(2, 3))
get.norm.sd(q = q)
get.norm.sd(q = q, fit.weights = c(1, 10, 1))
get.norm.sd(q = q, fit.weights = c(10, 1, 10))
get.norm.sd(q = q, fit.weights = c(1, 100, 1))
get.norm.sd(q = q, fit.weights = c(100, 1, 100))
graphics::par(old.par)

## other examples
q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 1, sd = 1)
get.norm.sd(q = q)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 1, sd = 0.5)
get.norm.sd(q = q)

q <- stats::qnorm(p = c(0.025, 0.5, 0.975), mean = 0.01, sd = 0.1)
get.norm.sd(q = q)




