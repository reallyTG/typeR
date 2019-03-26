library(lognorm)


### Name: computeEffectiveAutoCorr
### Title: computeEffectiveAutoCorr
### Aliases: computeEffectiveAutoCorr

### ** Examples

# generate autocorrelated time series
res <- stats::filter(rnorm(1000), filter = rep(1,5), circular = TRUE)
res[100:120] <- NA
(effAcf <- computeEffectiveAutoCorr(res))



