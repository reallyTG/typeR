library(IRISMustangMetrics)


### Name: getGeneralValueMetrics
### Title: Retrieve measurements from the MUSTANG BSS
### Aliases: getGeneralValueMetrics
###   getGeneralValueMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character-method
### Keywords: webservices

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices (including the BSS)
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D starttime <- as.POSIXct("2016-08-01", tz="GMT")
##D endtime <- starttime + 30*24*3600
##D metricName <- "sample_max,sample_mean,orientation_check"
##D 
##D # Get the measurement dataframe
##D juneStats <- getGeneralValueMetrics(iris,"IU","ANMO","","BH[12Z]",
##D                                         starttime,endtime,metricName)
##D 
##D print(juneStats)
##D   
## End(Not run)



