library(mle.tools)


### Name: observed.varcov
### Title: Observed Fisher Information
### Aliases: observed.varcov

### ** Examples

{library(mle.tools); library(fitdistrplus); set.seed(1)};

##Normal distribution
lpdf <- quote(-log(sigma) - 0.5 / sigma ^ 2 * (x - mu) ^ 2)

x <- rnorm(n = 100, mean = 0.0, sd = 1.0)

observed.varcov(logdensity = lpdf, X = x, parms = c("mu", "sigma"),
 mle = c(mean(x), sd(x)))

################################################################################

## Weibull distribution
lpdf <- quote(log(shape) - shape * log(scale) + shape * log(x) - (x / scale) ^ shape)

x <- rweibull(n = 100, shape = 1.5, scale = 2.0)

fit <- fitdist(data = x, distr = 'weibull')
fit$vcov

observed.varcov(logdensity = lpdf, X = x, parms = c("shape", "scale"), mle = fit$estimate)

################################################################################

## Exponetial distribution
lpdf <- quote(log(rate) - rate * x)

x <- rexp(n = 100, rate = 0.5)

fit <- fitdist(data = x, distr = 'exp')
fit$vcov

observed.varcov(logdensity = lpdf, X = x, parms = c("rate"), mle = fit$estimate)

################################################################################

## Gamma distribution
lpdf <- quote(-shape * log(scale) - lgamma(shape) + shape * log(x) -
 x / scale)

x <- rgamma(n = 100, shape = 1.5, scale = 2.0)

fit <- fitdist(data = x, distr = 'gamma', start = list(shape = 1.5, scale =  2.0))
fit$vcov

observed.varcov(logdensity = lpdf, X = x, parms = c("shape", "scale"), mle = fit$estimate)

################################################################################

## Beta distribution
lpdf <- quote(lgamma(shape1 + shape2) - lgamma(shape1) - lgamma(shape2) +
  shape1 * log(x) + shape2 * log(1 - x))

x <- rbeta(n = 100, shape1 = 2.0, shape2 = 2.0)

fit <- fitdist(data = x, distr = 'beta', start = list(shape1 = 2.0, shape2 =  2.0))
fit$vcov

observed.varcov(logdensity = lpdf, X = x, parms = c("shape1", "shape2"), mle = fit$estimate)




