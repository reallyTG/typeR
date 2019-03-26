library(rFDSN)


### Name: FDSNGetEvents
### Title: Download earthquake data from FDSN.
### Aliases: FDSNGetEvents
### Keywords: connection

### ** Examples


## Not run: 
##D 
##D #Get all earthquakes within 2 degrees of Socorro, new Mexico, 
##D #between 2010 and 2013
##D 
##D #IRIS event server
##D base.url <- "http://service.iris.edu/fdsnws/event/1/"
##D 
##D #Selection criteria
##D parameters <- list(
##D     name = c(
##D     "latitude",
##D     "longitude",
##D     "maxradius",
##D     "start",
##D     "end"),
##D     value = c(
##D     34.068110, #Latitude
##D     -106.901847, #Longitude
##D     2, #Degrees from center point
##D     "2010-01-01", #Start time
##D     "2014-01-01") #End time
##D     )
##D 
##D events <- FDSNGetEvents(base.url, parameters)
##D 
##D 
## End(Not run)



