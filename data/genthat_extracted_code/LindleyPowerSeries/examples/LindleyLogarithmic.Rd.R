library(LindleyPowerSeries)


### Name: plindleylogarithmic
### Title: LindleyLogarithmic
### Aliases: plindleylogarithmic dlindleylogarithmic hlindleylogarithmic
###   qlindleylogarithmic rlindleylogarithmic

### ** Examples

set.seed(1)
lambda = 1
theta = 0.5
n = 10
x <- seq(from = 0.1,to = 6,by = 0.5)
p <- seq(from = 0.1,to = 1,by = 0.1)
plindleylogarithmic(x, lambda, theta, log.p = FALSE)
dlindleylogarithmic(x, lambda, theta)
hlindleylogarithmic(x, lambda, theta)
qlindleylogarithmic(p, lambda, theta)
rlindleylogarithmic(n, lambda, theta)



