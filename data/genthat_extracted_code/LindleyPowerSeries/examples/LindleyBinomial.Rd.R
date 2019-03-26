library(LindleyPowerSeries)


### Name: plindleybinomial
### Title: LindleyBinomial
### Aliases: plindleybinomial dlindleybinomial hlindleybinomial
###   qlindleybinomial rlindleybinomial

### ** Examples

set.seed(1)
lambda = 1
theta = 0.5
n = 10
m = 10
x <- seq(from = 0.1,to = 6,by = 0.5)
p <- seq(from = 0.1,to = 1,by = 0.1)
plindleybinomial(x, lambda, theta, m, log.p = FALSE)
dlindleybinomial(x, lambda, theta, m)
hlindleybinomial(x, lambda, theta, m)
qlindleybinomial(p, lambda, theta, m)
rlindleybinomial(n, lambda, theta, m)



