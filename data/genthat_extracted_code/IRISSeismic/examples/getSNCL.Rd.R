library(IRISSeismic)


### Name: getSNCL
### Title: Retrieve seismic data from IRIS DMC
### Aliases: getSNCL getSNCL,IrisClient,character,POSIXct,POSIXct-method
### Keywords: webservices

### ** Examples
 
## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Use getSNCL to request data for II.JTS.00.BHZ
##D starttime <- as.POSIXct("2001-02-28",tz="GMT")
##D endtime <- as.POSIXct("2001-03-01",tz="GMT")
##D 
##D st <- getSNCL(iris, "II.JTS.00.BHZ",starttime, endtime, quality="M",
##D               repository="primary",inclusiveEnd=FALSE,ignoreEpoch=TRUE)
##D 
##D # Display structure of trace(s)
##D 
##D str(st)
##D 
##D # Plot trace
##D plot(st)
## End(Not run)



