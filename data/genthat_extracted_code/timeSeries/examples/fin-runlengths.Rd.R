library(timeSeries)


### Name: runlengths
### Title: Runlengths of a Time Series
### Aliases: runlengths
### Keywords: chron

### ** Examples

## random time series - 
   set.seed(4711)
   x <- rnorm(12)
   tS <- timeSeries(data=x, charvec=timeCalendar(), units="x")
   tS
   
## return runlengths -
   runlengths(tS)



