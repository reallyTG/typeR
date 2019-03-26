library(oce)


### Name: subset,adp-method
### Title: Subset an ADP Object
### Aliases: subset,adp-method

### ** Examples

library(oce)
data(adp)
# First part of time series
plot(subset(adp, time < mean(range(adp[['time']]))))




