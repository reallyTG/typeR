library(simIReff)


### Name: effCont-helper
### Title: Helper functions for continuous effectiveness distributions
### Aliases: effCont-helper cap effContMean effContVar effContTrunc

### ** Examples

cap(c(0, .5, 1))

effContMean(function(p) qnorm(p, mean = 4))
effContMean(function(p) qbeta(p, 1, 2))

effContVar(function(p) qnorm(p, mean = 2, sd = 4), 2)
effContVar(function(p) qbeta(p, 1, 2), 1/3)

tr <- effContTrunc(dnorm, pnorm, qnorm, mean = .8, sd = .3)
x01 <- seq(0, 1, .01)
plot(x01, tr$d(x01), type = "l")
plot(x01, tr$p(x01), type = "l")
plot(x01, tr$q(x01), type = "l")



