library(IRISMustangMetrics)


### Name: crossCorrelationMetric
### Title: Correlation between channels
### Aliases: crossCorrelationMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get the same signal, shifted by 3 seconds
##D starttime <- as.POSIXct("2013-11-12 07:09:45",tz="GMT")
##D endtime <- starttime + 600
##D st1 <- getSNCL(iris,"NM.SLM.00.BHZ",starttime,endtime)
##D st2 <- getSNCL(iris,"NM.SLM.00.BHZ",starttime+3,endtime+3)
##D 
##D # Cross-correlate
##D crossCorrelationMetric(st1,st2)
##D   
## End(Not run)



