library(IRISMustangMetrics)


### Name: saveMetricList
### Title: Save a MetricList as RData or XML
### Aliases: saveMetricList

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get the waveform
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D 
##D # Apply a metric and show the results
##D metricList <- stateOfHealthMetric(st)
##D metricList <- append(metricList, basicStatsMetric(st))
##D saveMetricList(metricList,id='AK.PIN..BHZ')
##D   
## End(Not run)



