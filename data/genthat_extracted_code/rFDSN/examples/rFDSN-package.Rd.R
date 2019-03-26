library(rFDSN)


### Name: rFDSN-package
### Title: Get seismic data from the International Federation of Digital
###   Seismograph Networks
### Aliases: rFDSN-package rFDSN
### Keywords: package

### ** Examples

#Find all stations with operating vertical seismic channels
#within 2 degrees of Socorro, New Mexico,
#between 2010 and 2013
#available through the IRIS DMC server.

library(rFDSN)

## Not run: 
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
##D #Download pressure data at station Y22D on August 9, 2014
##D 
##D #IRIS data download server
##D base.url <- "http://service.iris.edu/fdsnws/dataselect/1/"
##D parameters <- list(
##D     name = c(
##D     "sta",
##D     "cha",
##D     "start",
##D     "end"),
##D     value = c(
##D     "Y22D", #Station name
##D     "BDF", #SEED channel name
##D     "2014-08-09T00:00:00.000", #Midnight GMT
##D     "2014-08-09T23:59:59.999") #Midnight GMT
##D    )
##D miniseed.file <- FDSNGetTimeSeries(base.url, parameters, save.file = "Y22D_BDF.mseed")
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
## End(Not run)



