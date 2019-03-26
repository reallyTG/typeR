library(rriskDistributions)


### Name: get.nbinom.par
### Title: Fitting parameters of a negative binomial distribution from two
###   or more quantiles
### Aliases: get.nbinom.par
### Keywords: fitpercentiles

### ** Examples

q <- stats::qnbinom(p = c(0.025, 0.5, 0.975), size = 10, prob = 0.5)
old.par <- graphics::par(mfrow = c(2, 3))
get.nbinom.par(q = q)
get.nbinom.par(q = q, fit.weights = c(100, 1, 100))
get.nbinom.par(q = q, fit.weights = c(1, 100, 1))
get.nbinom.par(q = q, fit.weights = c(10, 1, 10))
get.nbinom.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

q <- stats::qnbinom(p = c(0.025, 0.5, 0.975), size = 1, prob = 0.5)
old.par <- graphics::par(mfrow = c(2, 3))
get.nbinom.par(q = q, tol = 0.01)
get.nbinom.par(q = q, fit.weights = c(100, 1, 100))
get.nbinom.par(q = q, fit.weights = c(1, 100, 1), tol = 0.01)
get.nbinom.par(q = q, fit.weights = c(10, 1, 10), tol = 0.01)
get.nbinom.par(q = q, fit.weights = c(1, 10, 1), tol = 0.01)
graphics::par(old.par)

q <- stats::qnbinom(p = c(0.025, 0.5, 0.975), size = 1, prob = 0.1)
old.par <- graphics::par(mfrow = c(2, 3))
get.nbinom.par(q = q)
get.nbinom.par(q = q, fit.weights = c(100, 1, 100))
get.nbinom.par(q = q, fit.weights = c(1, 100, 1))
get.nbinom.par(q = q, fit.weights = c(10, 1, 10))
get.nbinom.par(q = q, fit.weights = c(1, 10, 1))
graphics::par(old.par)

## example with only two quantiles
q <- stats::qnbinom(p = c(0.025, 0.975), size = 10, prob = 0.5)
old.par <- graphics::par(mfrow = c(2, 3))
get.nbinom.par(p = c(0.025, 0.975), q = q,)
get.nbinom.par(p = c(0.025, 0.975), q = q, fit.weights = c(100, 1))
get.nbinom.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 100))
get.nbinom.par(p = c(0.025, 0.975), q = q, fit.weights = c(10, 1))
get.nbinom.par(p = c(0.025, 0.975), q = q, fit.weights = c(1, 10))
graphics::par(old.par)




