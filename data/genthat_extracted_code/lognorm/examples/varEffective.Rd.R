library(lognorm)


### Name: varEffective
### Title: varEffective
### Aliases: varEffective

### ** Examples

# generate autocorrelated time series
res <- stats::filter(rnorm(1000), filter = rep(1,5), circular = TRUE)
res[100:120] <- NA
# if correlations are neglected, the estimate of the variance is biased low
(varNeglectCorr <- var(res, na.rm = TRUE))
(varCorr <- varEffective(res, na.rm = TRUE))



