library(IRISMustangMetrics)


### Name: stateOfHealthMetric
### Title: State of Health metrics
### Aliases: stateOfHealthMetric
### Keywords: metrics

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
##D # Generate State of Health metrics and show the results
##D metricList <- stateOfHealthMetric(st)
##D dummy <- lapply(metricList, show)
##D   
## End(Not run)



