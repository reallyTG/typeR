library(IRISSeismic)


### Name: Trace-class
### Title: Class '"Trace"'
### Aliases: Trace-class Trace as.vector,Trace-method
###   initialize,Trace-method isDC isDC,Trace-method plot,Trace-method
### Keywords: classes

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Set the starttime and endtime
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D 
##D # Get the first trace and generate some statistics
##D tr1 <- st@traces[[1]]
##D min(tr1)
##D median(tr1)
##D mean(tr1)
##D max(tr1)
##D sd(tr1)
##D rms(tr1)
##D rmsVariance(tr1)
## End(Not run)



