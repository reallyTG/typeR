library(IRISMustangMetrics)


### Name: upDownTimesMetric
### Title: Up/down times for a channel
### Aliases: upDownTimesMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D 
##D # Create the upDownTimesMetric, ignoring Traces < 3 minutes and gaps of < 5 minutes
##D metricList <- upDownTimesMetric(st, min_signal=180, min_gap=300)
##D   
## End(Not run)



