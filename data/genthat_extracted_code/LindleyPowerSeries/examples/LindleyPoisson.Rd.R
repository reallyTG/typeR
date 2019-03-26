library(LindleyPowerSeries)


### Name: plindleypoisson
### Title: LindleyPoisson
### Aliases: plindleypoisson dlindleypoisson hlindleypoisson
###   qlindleypoisson rlindleypoisson

### ** Examples

set.seed(1)
lambda = 1
theta = 0.5
n = 10
x <- seq(from = 0.1,to = 6,by = 0.5)
p <- seq(from = 0.1,to = 1,by = 0.1)
plindleypoisson(x, lambda, theta, log.p = FALSE)
dlindleypoisson(x, lambda, theta)
hlindleypoisson(x, lambda, theta)
qlindleypoisson(p, lambda, theta)
rlindleypoisson(n, lambda, theta)



