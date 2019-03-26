library(IRISSeismic)


### Name: getAvailability
### Title: Retrieve Channel metadata from IRIS DMC
### Aliases: getAvailability
###   getAvailability,IrisClient,character,character,character,character,POSIXct,POSIXct,logical-method
###   getAvailability,IrisClient,character,character,character,character,POSIXct,POSIXct,missing-method
### Keywords: webservices

### ** Examples

# Open a connection to IRIS DMC webservices
iris <- new("IrisClient")

# Date of Nisqually quake
starttime <- as.POSIXct("2001-02-28",tz="GMT")
endtime <- starttime + 2*24*3600

# Use  getEvent web service to retrieve events in this time period
events <- getEvent(iris,starttime,endtime,6.0)
events

# biggest event is Nisqually
eIndex <- which(events$magnitude == max(events$magnitude))
e <- events[eIndex[1],]

# Find all BHZ channels collecting data at the time of the quake and within 
# 5 degrees of the quake epicenter
channels <- getAvailability(iris,"*","*","*","BHZ",starttime,endtime,
                            lat=e$latitude,long=e$longitude,maxradius=5)
channels



