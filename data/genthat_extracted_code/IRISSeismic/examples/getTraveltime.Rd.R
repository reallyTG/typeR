library(IRISSeismic)


### Name: getTraveltime
### Title: Retrieve seismic traveltime information from IRIS DMC
### Aliases: getTraveltime
###   getTraveltime,IrisClient,numeric,numeric,numeric,numeric,numeric-method
### Keywords: webservices

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Two days around the "Nisqually Quake"
##D starttime <- as.POSIXct("2001-02-27", tz="GMT")
##D endtime <- starttime + 3600 * 24 * 2
##D 
##D # Find biggest seismic event over these two days -- it's the "Nisqually"
##D events <- getEvent(iris, starttime, endtime, minmag=5.0)
##D bigOneIndex <- which(events$magnitude == max(events$magnitude))
##D bigOne <- events[bigOneIndex[1],]
##D 
##D # Find US stations that are available within an hour of the event
##D start <- bigOne$time
##D end <- start + 3600
##D availability <- getAvailability(iris, "US", "", "", "BHZ",
##D                                 starttime=start, endtime=end,
##D                                 latitude=bigOne$latitude, longitude=bigOne$longitude,
##D                                 minradius=0, maxradius=10)
##D     
##D # Get the station the furthest East
##D minLonIndex <- which(availability$longitude == max(availability$longitude))
##D snclE <- availability[minLonIndex,]
##D 
##D # Plot the BHZ signal from this station
##D st <- getDataselect(iris,snclE$network,snclE$station,snclE$location,snclE$channel,
##D                     start,end)
##D 
##D # Check that there is only a single trace and then plot it
##D length(st@traces)
##D tr <- st@traces[[1]]
##D plot(tr, subsampling=1) # need subsmpling=1 to add vertical lines with abline()
##D 
##D # Find travel times to this station
##D traveltimes <- getTraveltime(iris, bigOne$latitude, bigOne$longitude, bigOne$depth,
##D                              snclE$latitude, snclE$longitude)
##D 
##D # Look at the list                             
##D traveltimes
##D 
##D # mark the P and S arrival times
##D pArrival <- start + traveltimes$travelTime[traveltimes$phaseName=="P"]
##D sArrival <- start + traveltimes$travelTime[traveltimes$phaseName=="S"] 
##D abline(v=pArrival, col='red')
##D abline(v=sArrival, col='blue')
## End(Not run)



