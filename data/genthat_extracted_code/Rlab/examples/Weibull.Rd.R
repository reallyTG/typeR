library(Rlab)


### Name: Weibull
### Title: The Weibull Distribution
### Aliases: Weibull dweibull pweibull qweibull rweibull
### Keywords: distribution

### ** Examples

x <- c(0,rlnorm(50))
all.equal(dweibull(x, alpha = 1), dexp(x))
all.equal(pweibull(x, alpha = 1, beta = pi), pexp(x, rate = 1/pi))
## Cumulative hazard H():
all.equal(pweibull(x, 2.5, pi, lower=FALSE, log=TRUE), -(x/pi)^2.5, tol=1e-15)
all.equal(qweibull(x/11, alpha = 1, beta = pi), qexp(x/11, rate = 1/pi))



