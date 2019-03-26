library(IRISSeismic)


### Name: getChannel
### Title: Retrieve Channel metadata from IRIS DMC
### Aliases: getChannel
###   getChannel,IrisClient,character,character,character,character,POSIXct,POSIXct,logical-method
###   getChannel,IrisClient,character,character,character,character,POSIXct,POSIXct,missing-method
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

# Which stations in the US network are within 5 degrees of the quake epicenter?
stations <- getStation(iris,"US","*","*","BHZ",starttime,endtime,
                       lat=e$latitude,long=e$longitude,maxradius=5)
stations

# Get some detailed information on any BHZ channels at the "Octopus Mountain" station
channels <- getChannel(iris,"US","OCWA","*","BHZ",starttime,endtime)
channels



