library(fitur)


### Name: fit_univariate
### Title: Fit Univariate Distribution
### Aliases: fit_univariate

### ** Examples

# Fit Discrete Distribution
set.seed(42)
x <- rpois(1000, 3)
fitted <- fit_univariate(x, 'pois', type = 'discrete')
# density function
plot(fitted$dpois(x=0:10),
     xlab = 'x',
     ylab = 'dpois')
# distribution function
plot(fitted$ppois(seq(0, 10, 1)),
     xlab= 'x',
     ylab = 'ppois')
# quantile function
plot(fitted$qpois,
     xlab= 'x',
     ylab = 'qpois')
# sample from theoretical distribution
summary(fitted$rpois(100))
# estimated parameters from MLE
fitted$parameters

set.seed(24)
x <- rweibull(1000, shape = .5, scale = 2)
fitted <- fit_univariate(x, 'weibull')
# density function
plot(fitted$dweibull,
     xlab = 'x',
     ylab = 'dweibull')
# distribution function
plot(fitted$pweibull,
     xlab = 'x',
     ylab = 'pweibull')
# quantile function
plot(fitted$qweibull,
     xlab = 'x',
     ylab = 'qweibull')
# sample from theoretical distribution
summary(fitted$rweibull(100))
# estimated parameters from MLE
fitted$parameters



