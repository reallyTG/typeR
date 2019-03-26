library(IRISMustangMetrics)


### Name: SingleValueMetric-class
### Title: Class '"SingleValueMetric"'
### Aliases: SingleValueMetric-class SingleValueMetric
###   show,SingleValueMetric-method
### Keywords: classes

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
##D metricList <- basicStatsMetric(st)
##D show(metricList[[1]])
##D   
## End(Not run)



