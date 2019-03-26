library(IRISMustangMetrics)


### Name: basicStatsMetric
### Title: Min, median, mean, rms variance, max, and number of unique
###   values of a signal
### Aliases: basicStatsMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get the waveform
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime, inclusiveEnd=FALSE)
##D 
##D # Calculate some metrics and show the results
##D metricList <- basicStatsMetric(st)
##D dummy <- lapply(metricList, show)
##D   
## End(Not run)



