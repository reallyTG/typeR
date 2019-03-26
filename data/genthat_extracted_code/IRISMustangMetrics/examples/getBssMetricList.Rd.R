library(IRISMustangMetrics)


### Name: getBssMetricList
### Title: Retrieve measurements XML from the MUSTANG BSS and convert them
###   to a metricList
### Aliases: getBssMetricList
###   getBssMetricList,IrisClient,character,character,character,character,POSIXct,POSIXct,character,character-method
###   getBssMetricList,IrisClient,character,character,character,character,POSIXct,POSIXct,character,missing-method
### Keywords: webservices

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices (including the BSS)
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D starttime <- as.POSIXct("2014-01-24", tz="GMT")
##D endtime <- as.POSIXct("2014-01-25", tz="GMT")
##D 
##D # Get the metricList
##D metricList <- getBssMetricList(iris,"AK","PIN","","",starttime,endtime,
##D                                metricName="sample_mean")
##D show(metricList)
##D   
## End(Not run)



