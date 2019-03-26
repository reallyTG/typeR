library(IRISSeismic)


### Name: getUpDownTimes
### Title: Determine times when a channel starts/stops collecting data
### Aliases: getUpDownTimes getUpDownTimes,Stream,missing,missing-method
###   getUpDownTimes,Stream,numeric,numeric-method
### Keywords: methods

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
##D 
##D # Determine up/down transitions, ignoring Traces < 3 min and gaps < 5 min
##D upDownTimes <- getUpDownTimes(st, min_signal=180, min_gap=300)
##D 
##D # Or just plot them directly
##D plotUpDownTimes(st, min_signal=180, min_gap=300)
## End(Not run)



