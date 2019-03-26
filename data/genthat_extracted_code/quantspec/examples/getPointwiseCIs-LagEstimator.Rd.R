library(quantspec)


### Name: getPointwiseCIs-LagEstimator
### Title: Get pointwise confidence intervals for the quantile spectral
###   density kernel
### Aliases: getPointwiseCIs,LagEstimator-method
###   getPointwiseCIs-LagEstimator
### Keywords: Access-functions

### ** Examples

lagEst <- lagEstimator(rnorm(2^10), levels.1=0.5)
CI.upper <- Re(getPointwiseCIs(lagEst)$upperCIs[,1,1])
CI.lower <- Re(getPointwiseCIs(lagEst)$lowerCIs[,1,1])
freq = 2*pi*(0:1023)/1024
plot(x = freq, y = rep(0.25/(2*pi),1024),
   ylim=c(min(CI.lower), max(CI.upper)),
   type="l", col="red") # true spectrum
lines(x = freq, y = CI.upper)
lines(x = freq, y = CI.lower)



