library(IRISSeismic)


### Name: Stream-class
### Title: Class '"Stream"'
### Aliases: Stream-class Stream plot,Stream-method plotUpDownTimes
###   plotUpDownTimes,Stream,missing,missing-method
###   plotUpDownTimes,Stream,missing,numeric-method
###   plotUpDownTimes,Stream,numeric,missing-method
###   plotUpDownTimes,Stream,numeric,numeric-method
###   plotUpDownTimes,POSIXct,missing,missing-method
###   plotUpDownTimes,POSIXct,missing,numeric-method
###   plotUpDownTimes,POSIXct,numeric,missing-method
###   plotUpDownTimes,POSIXct,numeric,numeric-method
###   slice,Stream,POSIXct,POSIXct-method uniqueIds uniqueIds,Stream-method
### Keywords: classes

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D min(st)
##D median(st)
##D mean(st)
##D max(st)
##D sd(st)
##D rms(st)
##D rmsVariance(st)
## End(Not run)



