library(IRISMustangMetrics)


### Name: correlationMetric
### Title: Correlation between channels
### Aliases: correlationMetric
### Keywords: metrics

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get seismic traces
##D starttime <- as.POSIXct("2013-03-01", tz="GMT")
##D endtime <- as.POSIXct("2013-03-02",tz="GMT")
##D stZ <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime,inclusiveEnd=FALSE)
##D st1 <- getDataselect(iris,"IU","ANMO","00","BH1",starttime,endtime,inclusiveEnd=FALSE)
##D st2 <- getDataselect(iris,"IU","ANMO","00","BH2",starttime,endtime,inclusiveEnd=FALSE)
##D 
##D # Calculate correlationMetric
##D correlationMetric(stZ,st1)[[1]]
##D correlationMetric(stZ,st2)[[1]]
##D correlationMetric(st1,st2)[[1]]
##D   
## End(Not run)



