library(timeSeries)


### Name: as
### Title: timeSeries Class, Coercion and Transformation
### Aliases: as as.timeSeries as.timeSeries.default as.timeSeries.ts
###   as.timeSeries.data.frame as.timeSeries.character as.timeSeries.zoo
###   as.ts,timeSeries-method as.data.frame,timeSeries-method
###   as.list,timeSeries-method as.matrix,timeSeries-method
###   as.ts.timeSeries as.data.frame.timeSeries as.list.timeSeries
###   as.matrix.timeSeries coerce,ANY,timeSeries-method
###   coerce,ts,timeSeries-method coerce,data.frame,timeSeries-method
###   coerce,character,timeSeries-method coerce,ANY,timeSeries-method
###   coerce,timeSeries,tse-method coerce,timeSeries,data.frame-method
###   coerce,timeSeries,list-method coerce,timeSeries,matrix-method
###   coerce,timeSeries,ts-method
### Keywords: chron

### ** Examples

## Create an Artificial timeSeries Object - 
   setRmetricsOptions(myFinCenter = "GMT")
   charvec <- timeCalendar()
   data <- matrix(rnorm(12))
   TS <- timeSeries(data, charvec, units = "RAND")
   TS

## Coerce to Vector - 
   as.vector(TS)
   
## Coerce to Matrix - 
   as.matrix(TS)
  
## Coerce to Data Frame - 
   as.data.frame(TS)



