library(timeSeries)


### Name: TimeSeriesClass
### Title: timeSeries Class
### Aliases: TimeSeriesClass timeSeries timeSeries,ANY,ANY-method
###   timeSeries,ANY,missing-method timeSeries,ANY,timeDate-method
###   timeSeries,matrix,ANY-method timeSeries,matrix,missing-method
###   timeSeries,matrix,timeDate-method timeSeries,missing,ANY-method
###   timeSeries,missing,missing-method timeSeries,missing,timeDate-method
###   timeSeries,matrix,numeric-method index_timeSeries time_timeSeries
###   timeSeries-class index_timeSeries-class time_timeSeries-class
###   initialize,timeSeries-method seriesData
### Keywords: chron

### ** Examples

## Load Microsoft Data -
   # Microsoft Data: 
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   head(MSFT)

## Create a timeSeries Object, The Direct Way ...
   Close <- MSFT[, 5]
   head(Close)
   
## Create a timeSeries Object from Scratch - 
   data <- as.matrix(MSFT[, 4])
   charvec <- rownames(MSFT)
   Close <- timeSeries(data, charvec, units = "Close")
   head(Close)
   c(start(Close), end(Close))
    
## Cut out April Data from 2001 - 
   tsApril01 <- window(Close, "2001-04-01", "2001-04-30") 
   tsApril01

## Compute Continuous Returns - 
   returns(tsApril01)
   
## Compute Discrete Returns - 
   returns(tsApril01, type = "discrete")
   
## Compute Discrete Returns, Don't trim -
   returns(tsApril01, trim = FALSE)
   
## Compute Discrete Returns, Use Percentage Values - 
   tsRet <- returns(tsApril01, percentage = TRUE, trim = FALSE)
   tsRet
     
## Aggregate Weekly - 
   GoodFriday(2001)
   to <- timeSequence(from = "2001-04-11", length.out = 3, by = "week") 
   from <- to - 6*24*3600
   from
   to
   applySeries(tsRet, from, to, FUN = sum)

## Create large timeSeries objects with different 'charvec' object classes - 
   # charvec is a 'timeDate' object
   head(timeSeries(1:1e6L, timeSequence(length.out = 1e6L, by = "sec")))
   head(timeSeries(1:1e6L, seq(Sys.timeDate(), length.out = 1e6L, by = "sec")))
   # 'charvec' is a 'POSIXt' object
   head(timeSeries(1:1e6L, seq(Sys.time(), length.out = 1e6L, by = "sec")))
   # 'charvec' is a 'numeric' object
   head(timeSeries(1:1e6L, 1:1e6L))



