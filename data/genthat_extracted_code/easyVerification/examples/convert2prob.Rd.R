library(easyVerification)


### Name: convert2prob
### Title: Convert to Probability / Category Forecast
### Aliases: convert2prob prob2thresh prob2thresh expandthresh
### Keywords: utilities

### ** Examples

tm <- toymodel()

## convert to tercile forecasts (only display first forecast and obs)
convert2prob(tm$fcst, prob=1:2/3)[1,]
convert2prob(tm$obs, prob=1:2/3)[1,]

## convert to category forecasts (smaller and larger than 1)
convert2prob(tm$fcst, threshold=1)[1,]
convert2prob(tm$obs, threshold=1)[1,]




