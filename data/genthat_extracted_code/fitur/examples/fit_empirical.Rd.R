library(fitur)


### Name: fit_empirical
### Title: Fit Empirical Distribution
### Aliases: fit_empirical

### ** Examples

set.seed(562)
x <- rpois(100, 5)
empDis <- fit_empirical(x)

# probability density function
plot(empDis$dempDis(0:10),
     xlab = 'x',
     ylab = 'dempDis')
# cumulative distribution function
plot(x = 0:10,
     y = empDis$pempDis(0:10),
     #type = 'l',
     xlab = 'x',
     ylab = 'pempDis')
# quantile function
plot(x = seq(.1, 1, .1),
     y = empDis$qempDis(seq(.1, 1, .1)),
     type = 'p',
     xlab = 'x',
     ylab = 'qempDis')
# random sample from fitted distribution
summary(empDis$r(100))

empDis$parameters

set.seed(562)
x <- rexp(100, 1/5)
empCont <- fit_empirical(x)

# probability density function
plot(x = 0:10,
     y = empCont$dempCont(0:10),
     xlab = 'x',
     ylab = 'dempCont')
# cumulative distribution function
plot(x = 0:10,
     y = empCont$pempCont(0:10),
     #type = 'l',
     xlab = 'x',
     ylab = 'pempCont')
# quantile function
plot(x = seq(.5, 1, .1),
     y = empCont$qempCont(seq(.5, 1, .1)),
     type = 'p',
     xlab = 'x',
     ylab = 'qempCont')
# random sample from fitted distribution
summary(empCont$r(100))

empCont$parameters



