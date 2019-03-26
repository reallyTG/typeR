library(rnoaa)


### Name: buoy
### Title: Get NOAA buoy data from the National Buoy Data Center
### Aliases: buoy buoys buoy_stations

### ** Examples

## Not run: 
##D # Get buoy station information
##D x <- buoy_stations()
##D library("leaflet")
##D leaflet(data = na.omit(x)) %>%
##D   leaflet::addTiles() %>%
##D   leaflet::addCircles(~lon, ~lat, opacity = 0.5)
##D 
##D # Get available buoys
##D buoys(dataset = 'cwind')
##D 
##D # Get data for a buoy
##D ## if no year or datatype specified, we get the first file
##D buoy(dataset = 'cwind', buoyid = 46085)
##D 
##D # Including specific year
##D buoy(dataset = 'cwind', buoyid = 41001, year = 1999)
##D 
##D # Including specific year and datatype
##D buoy(dataset = 'cwind', buoyid = 41001, year = 2008, datatype = "cc")
##D buoy(dataset = 'cwind', buoyid = 41001, year = 2008, datatype = "cc")
##D 
##D # Other datasets
##D buoy(dataset = 'ocean', buoyid = 41029)
##D 
##D # curl debugging
##D library('httr')
##D buoy(dataset = 'cwind', buoyid = 46085, config=verbose())
##D 
##D # some buoy ids are character, case doesn't matter, we'll account for it
##D buoy(dataset = "stdmet", buoyid = "VCAF1")
##D buoy(dataset = "stdmet", buoyid = "wplf1")
##D buoy(dataset = "dart", buoyid = "dartu")
## End(Not run)



