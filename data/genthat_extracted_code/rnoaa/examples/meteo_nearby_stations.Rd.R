library(rnoaa)


### Name: meteo_nearby_stations
### Title: Find weather monitors near locations
### Aliases: meteo_nearby_stations

### ** Examples

## Not run: 
##D 
##D station_data <- ghcnd_stations() # Takes a while to run
##D 
##D lat_lon_df <- data.frame(id = c("sydney", "brisbane"),
##D                          latitude = c(-33.8675, -27.4710),
##D                          longitude = c(151.2070, 153.0234))
##D nearby_stations <-  meteo_nearby_stations(lat_lon_df = lat_lon_df,
##D                     station_data = station_data, radius = 10)
##D 
##D miami <- data.frame(id = "miami", latitude = 25.7617, longitude = -80.1918)
##D 
##D # Get all stations within 50 kilometers
##D meteo_nearby_stations(lat_lon_df = miami, station_data = station_data,
##D                       radius = 50, var = c("PRCP", "TMAX"),
##D                       year_min = 1992, year_max = 1992)
##D # Get the closest 10 monitors
##D meteo_nearby_stations(lat_lon_df = miami, station_data = station_data,
##D                       limit = 10, var = c("PRCP", "TMAX"),
##D                       year_min = 1992, year_max = 1992)
## End(Not run)



