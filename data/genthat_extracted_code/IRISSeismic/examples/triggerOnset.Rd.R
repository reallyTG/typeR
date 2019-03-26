library(IRISSeismic)


### Name: triggerOnset
### Title: Event onset triggering
### Aliases: triggerOnset triggerOnset,Trace,numeric-method
### Keywords: methods

### ** Examples

# Open a connection to IRIS DMC webservices
iris <- new("IrisClient")

starttime <- as.POSIXct("2010-02-27 06:00:00",tz="GMT")
endtime <- as.POSIXct("2010-02-27 09:00:00",tz="GMT")
  
# Get the waveform
st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
tr <- st@traces[[1]]
picker <- STALTA(tr,3,30)

# Identify the onset of the event
to <- triggerOnset(tr,picker)

plot(tr)
abline(v=to, col='red', lwd=2)



