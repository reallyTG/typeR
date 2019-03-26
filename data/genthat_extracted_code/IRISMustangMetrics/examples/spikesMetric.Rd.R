library(IRISMustangMetrics)


### Name: spikesMetric
### Title: Find spikes using a rolling Hampel filter
### Aliases: spikesMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get the waveform
##D starttime <- as.POSIXct("2013-01-03 15:00:00", tz="GMT")
##D endtime <- starttime + 3600 * 3  
##D st <- getDataselect(iris,"IU","RAO","10","BHZ",starttime,endtime)
##D 
##D # Calculate the gaps metrics and show the results
##D metricList <- spikesMetric(st)
##D dummy <- show(metricList)
##D   
## End(Not run)



