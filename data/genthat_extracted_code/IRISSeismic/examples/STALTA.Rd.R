library(IRISSeismic)


### Name: STALTA
### Title: STA/LTA
### Aliases: STALTA
###   STALTA,Trace,missing,missing,missing,missing,missing,missing,missing-method
###   STALTA,Trace,numeric,numeric,character,logical,logical,numeric,numeric-method
###   STALTA,Trace,numeric,numeric,character,missing,missing,missing,missing-method
###   STALTA,Trace,numeric,numeric,missing,missing,missing,missing,missing-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2010-02-27",tz="GMT")
##D endtime <- as.POSIXct("2010-02-28",tz="GMT")
##D   
##D # Get the waveform
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D tr <- st@traces[[1]]
##D picker <- STALTA(tr,3,30)
##D 
##D # Plot the trace and overlay the picker
##D plot(tr)
##D par(new=TRUE)
##D plot(picker, type='l', col='red', axes=FALSE, xlab="", ylab="")
##D mtext("Picker", side=1, line=-8, adj=0.05, col='red')
##D par(new=FALSE)
## End(Not run)



