library(deseasonalize)


### Name: getds
### Title: get deseasonalized time series
### Aliases: getds
### Keywords: ts

### ** Examples

z <- getds(log(Saugeen), s=12, Fm = 5, Fs = 4, ic = "AIC", lag.max = 20)$z
acf(z)



