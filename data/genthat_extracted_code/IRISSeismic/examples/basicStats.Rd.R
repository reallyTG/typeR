library(IRISSeismic)


### Name: basicStats
### Title: Length, Max, Mean, Median, Min and Standard Deviation
### Aliases: length max mean median min sd length,Trace-method
###   max,Trace-method mean,Trace-method median,Trace,logical-method
###   median,Trace,missing-method min,Trace-method sd,Trace,logical-method
###   sd,Trace,missing-method length,Stream-method max,Stream-method
###   mean,Stream-method median,Stream,logical-method
###   median,Stream,missing-method min,Stream-method
###   rms,Stream,logical-method rms,Stream,missing-method
###   rmsVariance,Stream,logical-method rmsVariance,Stream,missing-method
###   sd,Stream,logical-method sd,Stream,missing-method parallelLength
###   parallelMax parallelMean parallelMedian parallelMin parallelSd
###   parallelLength,Stream-method parallelMax,Stream,logical-method
###   parallelMax,Stream,missing-method parallelMean,Stream,logical-method
###   parallelMean,Stream,missing-method
###   parallelMedian,Stream,logical-method
###   parallelMedian,Stream,missing-method
###   parallelMin,Stream,logical-method parallelMin,Stream,missing-method
###   parallelRmsVariance,Stream,logical-method
###   parallelRmsVariance,Stream,missing-method
###   parallelSd,Stream,logical-method parallelSd,Stream,missing-method
### Keywords: methods

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
##D # Get the first trace and generate some statistics
##D tr1 <- st@traces[[1]]
##D length(tr1)
##D max(tr1)
##D mean(tr1)
##D sd(tr1)
## End(Not run)



