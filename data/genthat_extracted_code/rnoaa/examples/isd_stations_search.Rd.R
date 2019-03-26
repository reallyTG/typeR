library(rnoaa)


### Name: isd_stations_search
### Title: Search for NOAA ISD/ISH station data from NOAA FTP server.
### Aliases: isd_stations_search

### ** Examples

## Not run: 
##D ## lat, long, radius
##D isd_stations_search(lat = 38.4, lon = -123, radius = 250)
##D 
##D x <- isd_stations_search(lat = 60, lon = 18, radius = 200)
##D 
##D if (requireNamespace("leaflet")) {
##D   library("leaflet")
##D   leaflet() %>%
##D     addTiles() %>%
##D     addCircles(lng = x$longitude,
##D                lat = x$latitude,
##D                popup = x$station_name) %>%
##D     clearBounds()
##D }
##D 
##D ## bounding box
##D bbox <- c(-125.0, 38.4, -121.8, 40.9)
##D isd_stations_search(bbox = bbox)
## End(Not run)



