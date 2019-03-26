library(IRISSeismic)


### Name: TraceHeader-class
### Title: Class '"TraceHeader"'
### Aliases: TraceHeader-class TraceHeader as.headerLine,TraceHeader-method
###   as.headerLine initialize,TraceHeader-method show,TraceHeader-method
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
##D 
##D # Get the first trace and show the associated metadata
##D tr1 <- st@traces[[1]]
##D show(tr1@stats)
## End(Not run)



