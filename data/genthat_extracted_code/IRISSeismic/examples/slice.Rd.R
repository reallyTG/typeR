library(IRISSeismic)


### Name: slice
### Title: Slice a section out of a 'Trace' or 'Stream'
### Aliases: slice slice,Trace,POSIXct,POSIXct-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2002-04-20", tz="GMT")
##D endtime <- as.POSIXct("2002-04-21", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"US","OXF","","BHZ",starttime,endtime)
##D 
##D # This Stream object consists of 5 Traces
##D length(st@traces)
##D 
##D # Plotting the third trace shows a small quake
##D plot(st@traces[[3]])
##D 
##D # We can slice out the hour that has the quake signal
##D sliceStart <- as.POSIXct("2002-04-20 10:30:00", tz="GMT")
##D sliceEnd <- as.POSIXct("2002-04-20 11:30:00", tz="GMT")
##D stSlice <- slice(st, sliceStart, sliceEnd)
##D 
##D # Now we only have one Trace of an hour duration
##D length(stSlice@traces)
##D stSlice@traces[[1]]@stats
##D # And a better look at the quake signal
##D plot(stSlice@traces[[1]])
## End(Not run)



