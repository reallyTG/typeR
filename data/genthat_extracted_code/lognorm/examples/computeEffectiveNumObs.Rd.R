library(lognorm)


### Name: computeEffectiveNumObs
### Title: computeEffectiveNumObs
### Aliases: computeEffectiveNumObs

### ** Examples

# generate autocorrelated time series
res <- stats::filter(rnorm(1000), filter = rep(1,5), circular = TRUE)
res[100:120] <- NA
# plot the series of autocorrelated random variables
plot(res)
# plot their empirical autocorrelation function
acf(res, na.action = na.pass)
#effAcf <- computeEffectiveAutoCorr(res)
# the effective number of parameters is less than number of 1000 samples
(nEff <- computeEffectiveNumObs(res, na.rm = TRUE))



