library(IRISMustangMetrics)


### Name: timesMetric2Xml
### Title: Create XML for the BSS
### Aliases: timesMetric2Xml

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
##D # Make sure we're working with a single snclq
##D unique_ids <- uniqueIds(st)
##D if (length(unique_ids) > 1) {
##D   stop(paste("meanMetric: Stream has",unique_ids,"unique identifiers"))
##D }
##D snclq <- unique_ids[1]
##D 
##D # get the upDownTimes with a minimum signal length and minimum gap (secs)
##D upDownTimes <- getUpDownTimes(st, min_signal=30, min_gap=60)
##D   
##D # Create and return a MultipleTimeValue metric from the upDownTimes
##D m <- new("MultipleTimeValueMetric", snclq=snclq, starttime=starttime, 
##D          endtime=endtime, metricName="up_down_times", values=upDownTimes)
##D 
##D # Show the XML version of the metric
##D bssXml <- timesMetric2Xml(m)
##D cat(bssXml)
##D   
## End(Not run)



