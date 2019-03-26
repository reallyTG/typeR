## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.height = 5, fig.width = 7)
library(fitur)

## ----discrete------------------------------------------------------------
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

## ----continuous----------------------------------------------------------
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

## ----empiricalDiscrete---------------------------------------------------
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

## ----empiricalContinous--------------------------------------------------
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
plot(x = seq(.1, 1, by = .1),
     y = empCont$qempCont(seq(.1, 1, by = .1)),
     type = 'p',
     xlab = 'x',
     ylab = 'qempCont')
# random sample from fitted distribution
summary(empCont$r(100))
empCont$parameters

