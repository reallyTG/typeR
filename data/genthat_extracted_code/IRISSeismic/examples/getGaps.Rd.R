library(IRISSeismic)


### Name: getGaps
### Title: Gap analysis
### Aliases: getGaps getGaps,Stream,missing-method
###   getGaps,Stream,numeric-method
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
##D # Save the gap analysis in a variable
##D gapInfo <- getGaps(st)
##D 
##D # See what information is availble
##D names(gapInfo)
##D 
##D # Look at a histogram of data dropouts
##D hist(gapInfo$nsamples, breaks=50, 
##D      main="Data Gaps in AK.PIN..BHZ Jan 24, 2012",
##D      xlab="number of missing samples per gap")
## End(Not run)



