library(IRISSeismic)


### Name: multiplyBy
### Title: Multiplication by a constant
### Aliases: multiplyBy multiplyBy,Stream,numeric-method
###   multiplyBy,Trace,numeric-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2011-01-24", tz="GMT")
##D endtime <- as.POSIXct("2011-01-25", tz="GMT")
##D 
##D # Get the waveform
##D stRaw <- getDataselect(iris,"AK","PIN","","BHZ",starttime,endtime)
##D 
##D # obtain an instrument sensitivity value with getChannel metadata)
##D c <- getChannel(iris, "AK","PIN","","BHZ",starttime, endtime)
##D sensitivityValue <- c$scale
##D 
##D # convert raw data
##D st <- multiplyBy(stRaw, 1/sensitivityValue)
##D rmsVariance(st)
##D 
##D # plot trace
##D plot(st, ylab=c$scaleunits)
## End(Not run)



