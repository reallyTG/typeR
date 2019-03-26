library(IRISMustangMetrics)


### Name: getPsdMetrics
### Title: Retrieve measurements from the MUSTANG BSS
### Aliases: getPsdMetrics
###   getPsdMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character-method
###   getPsdMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,missing-method
### Keywords: webservices

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices (including the BSS)
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D 
##D # Get the measurement XML
##D psdDF <- getPsdMetrics(iris,"AK","PIN","","BHZ", starttime,endtime)
##D   
## End(Not run)



