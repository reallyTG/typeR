library(googleway)


### Name: google_distance
### Title: Google Distance
### Aliases: google_distance

### ** Examples

## Not run: 
##D 
##D set_key("YOUR_GOOGLE_API_KEY")
##D google_distance(origins = list(c("Melbourne Airport, Australia"),
##D                              c("MCG, Melbourne, Australia"),
##D                              c(-37.81659, 144.9841)),
##D                              destinations = c("Portsea, Melbourne, Australia"),
##D                              simplify = FALSE)
##D 
##D google_distance(origins = c(-37.816, 144.9841),
##D     destinations = c("Melbourne Airport, Australia", "Flinders Street Station, Melbourne"))
##D 
##D google_distance(origins = tram_stops[1:5, c("stop_lat", "stop_lon")],
##D      destinations = tram_stops[10:12, c("stop_lat", "stop_lon")],)
##D 
## End(Not run)



