library(IRISMustangMetrics)


### Name: SNRMetric
### Title: Signal to Noise Ratio
### Aliases: SNRMetric
### Keywords: metrics

### ** Examples

 ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get an hour long waveform centered on a big quake
##D starttime <- as.POSIXct("2010-02-27 06:16:15",tz="GMT")
##D endtime <- as.POSIXct("2010-02-27 07:16:15",tz="GMT")
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D tr <- st@traces[[1]]
##D 
##D # Calculate the SNR metric and show the results
##D metricList <- SNRMetric(st)
##D dummy <- lapply(metricList, show)
##D   
## End(Not run)



