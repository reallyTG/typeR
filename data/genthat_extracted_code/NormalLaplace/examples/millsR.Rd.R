library(NormalLaplace)


### Name: MillsRatio
### Title: Mills Ratio
### Aliases: MillsRatio millsR
### Keywords: math

### ** Examples


## compare millsR calculated directly with the millsR calculated
## by transforming to log scale and then back-transformed
millsR(1:10)
exp(millsR(1:10, log = TRUE))
exp(millsR(10*(1:10)))
exp(millsR(10*(1:10), log = TRUE))



