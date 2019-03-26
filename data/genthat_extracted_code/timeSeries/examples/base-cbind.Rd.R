library(timeSeries)


### Name: bind
### Title: Bind two timeSeries objects
### Aliases: cbind rbind cbind2 rbind2 cbind.timeSeries rbind.timeSeries
###   cbind2,ANY,timeSeries-method cbind2,timeSeries,ANY-method
###   cbind2,timeSeries,missing-method cbind2,timeSeries,timeSeries-method
###   rbind2,ANY,timeSeries-method rbind2,timeSeries,ANY-method
###   rbind2,timeSeries,missing-method rbind2,timeSeries,timeSeries-method
### Keywords: chron

### ** Examples

## Load Microsoft Data Set -
   x <- MSFT[1:12, ]
   x

## Bind Columnwise -
   X <- cbind(x[, "Open"], returns(x[, "Open"]))
   colnames(X) <- c("Open", "Return")
   X

## Bind Rowwise - 
   Y <- rbind(x[1:3, "Open"], x[10:12, "Open"])
   Y



