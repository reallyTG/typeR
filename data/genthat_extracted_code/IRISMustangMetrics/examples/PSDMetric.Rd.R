library(IRISMustangMetrics)


### Name: PSDMetric
### Title: Power Spectral Density of a signal
### Aliases: PSDMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # NOTE:  The following trace has 1.728 million points.
##D # NOTE:  Downloading and calculating PSD may take a few seconds.
##D starttime <- as.POSIXct("2010-02-27",tz="GMT")
##D endtime <- as.POSIXct("2010-02-28",tz="GMT")
##D   
##D # Get the waveform
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D 
##D # Calculate the PSD metric and show the SingleValueMetric results
##D listOfLists <- PSDMetric(st)
##D svMetricList <- listOfLists[['svMetricList']]
##D 
##D dummy <- lapply(svMetricList, show)
##D   
## End(Not run)



