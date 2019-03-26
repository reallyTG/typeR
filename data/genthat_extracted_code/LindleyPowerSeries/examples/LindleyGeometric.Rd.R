library(LindleyPowerSeries)


### Name: plindleygeometric
### Title: LindleyGeometric
### Aliases: plindleygeometric dlindleygeometric hlindleygeometric
###   qlindleygeometric rlindleygeometric

### ** Examples

set.seed(1)
lambda = 1
theta = 0.5
n = 10
x <- seq(from = 0.1,to = 6,by = 0.5)
p <- seq(from = 0.1,to = 1,by = 0.1)
plindleygeometric(x, lambda, theta, log.p = FALSE)
dlindleygeometric(x, lambda, theta)
hlindleygeometric(x, lambda, theta)
qlindleygeometric(p, lambda, theta)
rlindleygeometric(n, lambda, theta)



