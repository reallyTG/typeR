library(IRISSeismic)


### Name: rms
### Title: Root Mean Square and RMS Variance
### Aliases: rms rms,Trace,logical-method rms,Trace,missing-method
###   rmsVariance,Trace,logical-method rmsVariance,Trace,missing-method
###   parallelRms rmsVariance parallelRmsVariance
### Keywords: methods

### ** Examples

## Not run: 
##D 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D 
##D # Get the first trace and generate some statistics
##D tr <- st@traces[[1]]
##D rmsVariance(tr)
## End(Not run)



