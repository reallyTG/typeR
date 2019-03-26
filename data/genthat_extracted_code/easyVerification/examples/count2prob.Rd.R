library(easyVerification)


### Name: count2prob
### Title: Convert Ensemble Counts to Probabilities
### Aliases: count2prob
### Keywords: utilities

### ** Examples

tm <- toymodel()

## convert to tercile forecasts (only display first forecast and obs)
count2prob(convert2prob(tm$fcst, prob=1:2/3))[1,]
count2prob(convert2prob(tm$obs, prob=1:2/3))[1,]





