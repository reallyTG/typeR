library(timeSeries)


### Name: is.timeSeries
### Title: timeSeries Class, Coercion and Transformation
### Aliases: is.timeSeries is.signalSeries is.na,timeSeries-method
###   is.unsorted,timeSeries-method
### Keywords: chron

### ** Examples

## Create an Artificial timeSeries Object - 
   setRmetricsOptions(myFinCenter = "GMT")
   charvec <- timeCalendar()
   data <- matrix(rnorm(12))
   TS <- timeSeries(data, charvec, units = "RAND")
   TS

## Test for timeSeries - 
   is.timeSeries(TS)



