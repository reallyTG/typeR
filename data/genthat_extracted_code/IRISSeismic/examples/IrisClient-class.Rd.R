library(IRISSeismic)


### Name: IrisClient-class
### Title: Class '"IrisClient"'
### Aliases: IrisClient-class initialize,IrisClient-method
### Keywords: classes

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D starttime <- as.POSIXct("2012-01-24", tz="GMT")
##D endtime <- as.POSIXct("2012-01-25", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D mean(st)
## End(Not run)



