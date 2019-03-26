library(IRISSeismic)


### Name: getUnavailability
### Title: Retrieve Channel metadata from IRIS DMC
### Aliases: getUnavailability
###   getUnavailability,IrisClient,character,character,character,character,POSIXct,POSIXct,logical-method
###   getUnavailability,IrisClient,character,character,character,character,POSIXct,POSIXct,missing-method
### Keywords: webservices

### ** Examples

# Open a connection to IRIS DMC webservices
iris <- new("IrisClient")

# Date of Nisqually quake
starttime <- as.POSIXct("2001-02-28",tz="GMT")
endtime <- starttime + 2*24*3600

# Use the getEvent web service to determine what events happened in this time period
events <- getEvent(iris,starttime,endtime,6.0)
events

# biggest event is Nisqually
eIndex <- which(events$magnitude == max(events$magnitude))
e <- events[eIndex[1],]

# Find all BHZ channels that were NOT collecting data at the time of the quake 
# and within 5 degrees of the quake epicenter (or are otherwise unavailable from IRIS).
channels <- getUnavailability(iris,"*","*","*","BHZ",starttime,endtime,
                              lat=e$latitude,long=e$longitude,maxradius=5)
channels



