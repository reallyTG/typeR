library(eseis)


### Name: aux_getFDSNstation
### Title: Query FDSN data base for stations
### Aliases: aux_getFDSNstation
### Keywords: eseis

### ** Examples


## Not run: 
##D 
##D x <- aux_getFDSNstation(start = as.POSIXct(x = "2010-01-01 22:22:22", 
##D                                            tz = "UTC"), 
##D                         centre = c(45, 10), 
##D                         radius = 1)
##D                            
##D ## optionally plot station locations on a map (requires RgoogleMaps)
##D center <- c(mean(x$station_latitude), 
##D             mean(x$station_longitude))
##D 
##D zoom <- min(RgoogleMaps::MaxZoom(range(x$station_latitude), 
##D                                  range(x$station_longitude)))
##D                                  
##D Map <- RgoogleMaps::GetMap(center = center,
##D                            zoom = zoom, 
##D                            maptype = "terrain")
##D                            
##D RgoogleMaps::PlotOnStaticMap(MyMap = Map, 
##D                              lat = x$station_latitude, 
##D                              lon = x$station_longitude, 
##D                              pch = 15, 
##D                              col = 4)
## End(Not run)
                     



