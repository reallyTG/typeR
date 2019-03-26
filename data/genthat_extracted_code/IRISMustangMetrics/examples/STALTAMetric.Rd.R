library(IRISMustangMetrics)


### Name: STALTAMetric
### Title: Maximum STA/LTA of a signal
### Aliases: STALTAMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get the waveform
##D starttime <- as.POSIXct("2012-02-12",tz="GMT")
##D endtime <- as.POSIXct("2012-02-13",tz="GMT")
##D st <- getDataselect(iris,"AK","GHO","","BHN",starttime,endtime)
##D 
##D # Calculate the STA/LTA metric and show the results
##D metricList <- STALTAMetric(st)
##D dummy <- lapply(metricList, show)
##D   
## End(Not run)



