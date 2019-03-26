library(flexsurv)


### Name: qgeneric
### Title: Generic function to find quantiles of a distribution
### Aliases: qgeneric
### Keywords: distribution

### ** Examples


qnorm(c(0.025, 0.975), 0, 1)
qgeneric(pnorm, c(0.025, 0.975), mean=0, sd=1) # must name the arguments



