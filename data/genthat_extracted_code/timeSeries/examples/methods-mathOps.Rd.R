library(timeSeries)


### Name: math
### Title: Mathematical Time Series Operations
### Aliases: math Ops,vector,timeSeries-method Ops,array,timeSeries-method
###   Ops,ts,timeSeries-method Ops,timeSeries,vector-method
###   Ops,timeSeries,array-method Ops,timeSeries,ts-method
###   Ops,timeSeries,timeSeries-method -,timeSeries,missing-method
###   +,timeSeries,missing-method cummax,timeSeries-method
###   cummin,timeSeries-method cumprod,timeSeries-method
###   cumsum,timeSeries-method Math,timeSeries-method
###   Math2,timeSeries-method Summary,timeSeries-method
###   trunc,timeSeries-method log,timeSeries-method
###   %*%,timeSeries,vector-method %*%,timeSeries,ANY-method
###   %*%,ANY,timeSeries-method quantile.timeSeries
###   quantile,timeSeries-method median.timeSeries median,timeSeries-method
### Keywords: chron methods

### ** Examples

## Create an Artificial timeSeries Object - 
   setRmetricsOptions(myFinCenter = "GMT")
   charvec = timeCalendar()
   set.seed(4711)
   data = matrix(exp(cumsum(rnorm(12, sd = 0.1))))
   TS = timeSeries(data, charvec, units = "TS")
   TS

## Mathematical Operations: | +/- * ^ ... - 
   TS^2
   TS[2:4]
   OR = returns(TS)
   OR
   OR > 0



