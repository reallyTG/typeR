library(IRISMustangMetrics)


### Name: DCOffsetTimesMetric
### Title: DC Offset Detection
### Aliases: DCOffsetTimesMetric
### Keywords: metrics

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get a signal with a DC offset problem
##D starttime <- as.POSIXct("2012-10-26",tz="GMT")
##D endtime <- starttime + 2*24*3600
##D st <- getDataselect(iris,"IU","TARA","00","BHZ",starttime,endtime)
##D 
##D # Calculate the metric
##D metricList <- DCOffsetTimesMetric(st)
##D 
##D # Extract values from the first element of the list
##D offsetTimes <- metricList[[1]]@values
##D 
##D # Plot the signal and mark locations where a DC offset was detected
##D plot(st)
##D abline(v=offsetTimes,col='red')
## End(Not run)



