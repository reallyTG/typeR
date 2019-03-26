library(IRISMustangMetrics)


### Name: transferFunctionMetric
### Title: Cross-spectral comparison
### Aliases: transferFunctionMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Create a new IrisClient
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D # Get seismic data
##D starttime <- as.POSIXct("2011-05-01", tz="GMT")
##D endtime <- starttime + 3600
##D # These values are specific to two 40 sps channels
##D minfreq <- 0.005255603
##D maxfreq <- 19.7403
##D nfreq <- 96
##D units <- 'def'
##D output <- 'fap'
##D 
##D st1 <- getDataselect(iris,"CI","PASC","00","BHZ",starttime,endtime)
##D st2 <- getDataselect(iris,"CI","PASC","10","BHZ",starttime,endtime)
##D evalresp1 <- getEvalresp(iris, "CI", "PASC", "00", "BHZ", starttime, 
##D                          minfreq, maxfreq, nfreq, units, output)
##D evalresp2 <- getEvalresp(iris, "CI", "PASC", "10", "BHZ", starttime, 
##D                          minfreq, maxfreq, nfreq, units, output)
##D 
##D # Calculate metrics
##D metricList <- transferFunctionMetric(st1,st2,evalresp1,evalresp2)
##D print(metricList)
##D   
## End(Not run)



