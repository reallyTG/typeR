library(mle.tools)


### Name: expected.varcov
### Title: Expected Fisher Information
### Aliases: expected.varcov

### ** Examples

{library(mle.tools); library(fitdistrplus); set.seed(1)};

## Normal distribution
pdf <- quote(1 / (sqrt(2 * pi) * sigma) * exp(-0.5 / sigma ^ 2 * (x - mu) ^ 2))
lpdf <- quote(-log(sigma) - 0.5 / sigma ^ 2 * (x - mu) ^ 2)

x <- rnorm(n = 100, mean = 0.0, sd = 1.0)

expected.varcov(density = pdf, logdensity = lpdf, n = length(x), parms = c("mu", "sigma"),
 mle = c(mean(x), sd(x)), lower = '-Inf', upper = 'Inf')

################################################################################

## Weibull distribution
pdf <- quote(shape / scale ^ shape * x ^ (shape - 1) * exp(-(x / scale) ^ shape))
lpdf <- quote(log(shape) - shape * log(scale) + shape * log(x) -
 (x / scale) ^ shape)

x <- rweibull(n = 100, shape = 1.5, scale = 2.0)

fit <- fitdist(data = x, distr = 'weibull')
fit$vcov

expected.varcov(density = pdf, logdensity = lpdf, n = length(x), parms = c("shape", "scale"),
 mle = fit$estimate, lower = 0)

################################################################################

## Expoentiated Weibull distribution
pdf <- quote(alpha * shape / scale ^ shape * x ^ (shape - 1) * exp(-(x / scale) ^ shape) *
 (1 - exp(-(x / scale) ^ shape)) ^ (alpha - 1))
lpdf <- quote(log(alpha) + log(shape) - shape * log(scale) + shape * log(x) -
 (x / scale) ^ shape + (alpha - 1) * log((1 - exp(-(x / scale) ^ shape))))

expected.varcov(density = pdf, logdensity = lpdf, n = 100, parms = c("shape", "scale", "alpha"),
 mle = c(1.5, 2.0, 1.0), lower = 0)
################################################################################

## Exponetial distribution
pdf <- quote(rate * exp(-rate * x))
lpdf <- quote(log(rate) - rate * x)

x <- rexp(n = 100, rate = 0.5)

fit <- fitdist(data = x, distr = 'exp')
fit$vcov

expected.varcov(density = pdf, logdensity = lpdf, n = length(x), parms = c("rate"),
 mle = fit$estimate, lower = 0)

################################################################################

## Gamma distribution
pdf <- quote(1 /(scale ^ shape * gamma(shape)) * x ^ (shape - 1) * exp(-x / scale))
lpdf <- quote(-shape * log(scale) - lgamma(shape) + shape * log(x) -
 x / scale)

x <- rgamma(n = 100, shape = 1.5, scale = 2.0)

fit <- fitdist(data = x, distr = 'gamma', start = list(shape = 1.5, scale =  2.0))
fit$vcov

expected.varcov(density = pdf, logdensity = lpdf, n = length(x), parms = c("shape", "scale"),
 mle = fit$estimate, lower = 0)

################################################################################

## Beta distribution
pdf <- quote(gamma(shape1 + shape2) / (gamma(shape1) * gamma(shape2)) * x ^ (shape1 - 1) *
(1 - x) ^ (shape2 - 1))
lpdf <- quote(lgamma(shape1 + shape2) - lgamma(shape1) - lgamma(shape2) +
 shape1 * log(x) + shape2 * log(1 - x))

x <- rbeta(n = 100, shape1 = 2.0, shape2 = 2.0)

fit <- fitdist(data = x, distr = 'beta', start = list(shape1 = 2.0, shape2 =  2.0))
fit$vcov

expected.varcov(density = pdf, logdensity = lpdf, n = length(x), parms = c("shape1", "shape2"),
 mle = fit$estimate, lower = 0, upper = 1)




