library(IRISSeismic)


### Name: getEvent
### Title: Retrieve seismic event information from IRIS DMC
### Aliases: getEvent getEvent,IrisClient,POSIXct,POSIXct-method
### Keywords: webservices

### ** Examples

  ## Not run: 
##D # NOTE:  'maps' and 'mapdata' packages must be installed
##D #require(maps)
##D #require(mapdata)
##D 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Get events > mag 5.0 over a week in June of 2012
##D starttime <- as.POSIXct("2012-06-21", tz="GMT")
##D endtime <- starttime + 3600 * 24 * 7
##D events <- getEvent(iris, starttime, endtime, minmag=5.0)
##D 
##D # Look at all events
##D print(paste(nrow(events),"earthquakes found with magnitude > 5.0"))
##D   
##D # Plot events on a map
##D #map('world')
##D #points(events$longitude, events$latitude, pch=16, cex=1.5, col='red')
##D #labels <- paste(" ", as.character(round(events$magnitude,1)), sep="")
##D #text(events$longitude, events$latitude, labels=labels, pos=4, cex=1.2, col='red3')
##D   
## End(Not run)



