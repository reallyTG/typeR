library(quantspec)


### Name: getPointwiseCIs-SmoothedPG
### Title: Get pointwise confidence intervals for the quantile spectral
###   density kernel, quantile coherency or quantile coherence.
### Aliases: getPointwiseCIs,SmoothedPG-method getPointwiseCIs-SmoothedPG
### Keywords: Access-functions

### ** Examples

sPG <- smoothedPG(rnorm(2^10), levels.1=0.5)
CI.upper <- Re(getPointwiseCIs(sPG)$upperCIs[,1,1])
CI.lower <- Re(getPointwiseCIs(sPG)$lowerCIs[,1,1])
freq = 2*pi*(0:1023)/1024
plot(x = freq, y = rep(0.25/(2*pi),1024),
   ylim=c(min(CI.lower), max(CI.upper)),
   type="l", col="red") # true spectrum
lines(x = freq, y = CI.upper)
lines(x = freq, y = CI.lower)



