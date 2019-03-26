library(LindleyPowerSeries)


### Name: plindleynb
### Title: LindleyNegativeBinomial
### Aliases: plindleynb dlindleynb hlindleynb qlindleynb rlindleynb

### ** Examples

set.seed(1)
lambda = 1
theta = 0.5
n = 10
m = 10
x <- seq(from = 0.1,to = 6,by = 0.5)
p <- seq(from = 0.1,to = 1,by = 0.1)
plindleynb(x, lambda, theta, m, log.p = FALSE)
dlindleynb(x, lambda, theta, m)
hlindleynb(x, lambda, theta, m)
qlindleynb(p, lambda, theta, m)
rlindleynb(n, lambda, theta, m)



