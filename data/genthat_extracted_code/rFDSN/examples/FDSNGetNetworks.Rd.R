library(rFDSN)


### Name: FDSNGetNetworks
### Title: Download network and station data from FDSN.
### Aliases: FDSNGetNetworks
### Keywords: connection

### ** Examples


## Not run: 
##D 
##D #Find all stations with operating vertical seismic channels
##D #within 2 degrees of Socorro, New Mexico,
##D #between 2010 and 2013
##D #available through the IRIS DMC server.
##D 
##D #IRIS station server
##D base.url <- "http://service.iris.edu/fdsnws/station/1/"
##D 
##D #Selection criteria
##D parameters <- list(
##D     name = c(
##D     "latitude",
##D     "longitude",
##D     "maxradius",
##D     "cha",
##D     "start",
##D     "end"),
##D     value = c(
##D     34.068110, #Latitude
##D     -106.901847, #Longitude
##D     2, #Degrees from center point
##D     "*Z",#Channel (with wildcards)
##D     "2010-01-01", #Start time
##D     "2014-01-01") #End time
##D     )
##D 
##D networks <- FDSNGetNetworks(base.url, parameters)
##D 
##D 
## End(Not run)



