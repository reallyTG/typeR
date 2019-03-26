library(IRISMustangMetrics)


### Name: metricList2DF
### Title: Convert a MetricList into a Tidy Dataframe
### Aliases: metricList2DF

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D client <- new("IrisClient")
##D 
##D # Get the waveforms
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D st1 <- getDataselect(client,"AK","PIN","","BHE",starttime,endtime)
##D st2 <- getDataselect(client,"AK","PIN","","BHN",starttime,endtime)
##D st3 <- getDataselect(client,"AK","PIN","","BHZ",starttime,endtime)
##D 
##D # Calculate metrics and append them to the metricList
##D metricList <- stateOfHealthMetric(st1)
##D metricList <- append(metricList, basicStatsMetric(st1))
##D metricList <- append(metricList, basicStatsMetric(st2))
##D metricList <- append(metricList, basicStatsMetric(st3))
##D 
##D # Create dataframe
##D metricDF <- metricList2DF(metricList)
##D head(metricDF)
##D   
## End(Not run)



