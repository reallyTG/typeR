library(IRISSeismic)


### Name: mergeUpDownTimes
### Title: Determine overlaps in two sets of upDownTimes.
### Aliases: mergeUpDownTimes mergeUpDownTimes,NULL,POSIXct,logical-method
###   mergeUpDownTimes,NULL,POSIXct,missing-method
###   mergeUpDownTimes,POSIXct,NULL,logical-method
###   mergeUpDownTimes,POSIXct,NULL,missing-method
###   mergeUpDownTimes,POSIXct,POSIXct,logical-method
###   mergeUpDownTimes,POSIXct,POSIXct,missing-method

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Three Streams, each with different upDownTimes
##D starttime <- as.POSIXct("2012-07-01", tz="GMT")
##D endtime <- as.POSIXct("2012-07-02", tz="GMT")
##D stE <- getDataselect(iris,"IU","XMAS","10","BHE",starttime,endtime)
##D stN <- getDataselect(iris,"IU","XMAS","10","BHN",starttime,endtime)
##D stZ <- getDataselect(iris,"IU","XMAS","10","BHZ",starttime,endtime)
##D udtE <- getUpDownTimes(stE)
##D udtN <- getUpDownTimes(stN)
##D udtZ <- getUpDownTimes(stZ)
##D 
##D udtAll <- c()
##D udtAny <- c()
##D for (udt in list(udtE, udtN, udtZ)) {
##D   udtAll <- mergeUpDownTimes(udtAll,udt,bothOn=TRUE)
##D   udtAny <- mergeUpDownTimes(udtAny,udt,bothOn=FALSE)
##D }
##D 
##D # 5 rows
##D layout(matrix(seq(5)))
##D 
##D # Plot the results
##D par(mar=c(3,4,3,2)) # adjust margins
##D plotUpDownTimes(udtE); title("BHE")
##D plotUpDownTimes(udtN); title("BHN")
##D plotUpDownTimes(udtZ); title("BHZ")
##D plotUpDownTimes(udtAll); title("ALL channels up")
##D plotUpDownTimes(udtAny); title("ANY channel up")
##D 
##D # Restore default layout
##D layout(1)
## End(Not run)



