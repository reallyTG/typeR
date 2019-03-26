library(rnoaa)


### Name: isd_stations
### Title: Get NOAA ISD/ISH station data from NOAA FTP server.
### Aliases: isd_stations

### ** Examples

## Not run: 
##D # Get station table
##D (stations <- isd_stations())
##D 
##D ## plot stations
##D ### remove incomplete cases, those at 0,0
##D df <- stations[complete.cases(stations$lat, stations$lon), ]
##D df <- df[df$lat != 0, ]
##D ### make plot
##D library("leaflet")
##D leaflet(data = df) %>%
##D   addTiles() %>%
##D   addCircles()
## End(Not run)



