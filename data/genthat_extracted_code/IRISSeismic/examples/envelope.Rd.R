library(IRISSeismic)


### Name: envelope
### Title: Envelope of a seismic signal
### Aliases: envelope envelope,Trace-method
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
##D # Demean, detrend, cosine taper
##D tr <- DDT(tr)
##D 
##D # Create envelope version of the trace
##D trenv <- envelope(tr)
##D 
##D # Plot signal data and envelope data
##D plot(tr@data, type='l', col='gray80')
##D points(trenv@data, type='l', col='blue')
## End(Not run)



