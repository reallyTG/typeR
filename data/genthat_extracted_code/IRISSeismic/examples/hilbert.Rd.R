library(IRISSeismic)


### Name: hilbert
### Title: Hilbert of a seismic signal
### Aliases: hilbert hilbert,Trace-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2010-02-27 06:00:00", tz="GMT")
##D endtime <- as.POSIXct("2010-02-27 09:00:00", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D tr <- st@traces[[1]]
##D 
##D # Create Hilbert transform of the trace
##D trh <- hilbert(tr)
##D 
##D # Plot signal data and hilbert data
##D plot(tr@data, type='l', col='gray80')
##D points(trh@data, type='l', col='blue')
## End(Not run)



