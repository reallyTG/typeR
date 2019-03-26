library(IRISSeismic)


### Name: eventWindow
### Title: Return a portion of a trace surrounding an event.
### Aliases: eventWindow eventWindow,Trace,numeric,missing,missing-method
###   eventWindow,Trace,numeric,missing,numeric-method
###   eventWindow,Trace,numeric,numeric,missing-method
###   eventWindow,Trace,numeric,numeric,numeric-method
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
##D # Seismic signal in third trace
##D tr <- st@traces[[3]]
##D 
##D # Create a picker
##D picker <- STALTA(tr,3,30)
##D threshold <- quantile(picker,0.99999,na.rm=TRUE)
##D 
##D # 3 rows
##D layout(matrix(seq(3)))
##D 
##D # Plot trace and p-wave closeups
##D closeup1 <- eventWindow(tr,picker,threshold,3600)
##D closeup2 <- eventWindow(tr,picker,threshold,600)
##D plot(tr)
##D plot(closeup1,subsampling=1)
##D abline(v=length(closeup1)/2, col='red')
##D plot(closeup2,subsampling=1)
##D abline(v=length(closeup2)/2, col='red')
##D 
##D # Restore default layout
##D layout(1)
## End(Not run)



