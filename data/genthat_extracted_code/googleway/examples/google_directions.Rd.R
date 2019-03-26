library(googleway)


### Name: google_directions
### Title: Google Directions
### Aliases: google_directions

### ** Examples

## Not run: 
##D 
##D set_key("YOUR_GOOGLE_API_KEY")
##D 
##D ## using lat/long coordinates
##D google_directions(origin = c(-37.8179746, 144.9668636),
##D           destination = c(-37.81659, 144.9841),
##D           mode = "walking")
##D 
##D 
##D ## using address string
##D google_directions(origin = "Flinders Street Station, Melbourne",
##D          destination = "MCG, Melbourne",
##D          mode = "walking")
##D 
##D 
##D google_directions(origin = "Melbourne Airport, Australia",
##D          destination = "Portsea, Melbourne, Australia",
##D          departure_time =  Sys.time() + (24 * 60 * 60),
##D          waypoints = list(stop = c(-37.81659, 144.9841),
##D                            via = "Ringwood, Victoria"),
##D          mode = "driving",
##D          alternatives = FALSE,
##D          avoid = c("TOLLS", "highways"),
##D          units = "imperial",
##D          simplify = TRUE)
##D 
##D ## using 'now' as departure time
##D google_directions(origin = "Flinders Street Station, Melbourne",
##D          destination = "MCG, Melbourne",
##D          departure_time = 'now')
##D 
##D ## waypoints expressed as an encoded polyline
##D polyWaypoints <- encode_pl(tram_stops[1:2, c("stop_lat")], tram_stops[1:2, c("stop_lon")])
##D polyWaypoints <- list(via = paste0("enc:", polyWaypoints, ":"))
##D 
##D google_directions(origin = "Melbourne Zoo, Melbourne",
##D          destination = "Studley Park, Melbourne",
##D          waypoints = polyWaypoints)
##D 
##D 
##D ## using bus and less walking
##D res <- google_directions(origin = "Melbourne Airport, Australia",
##D          destination = "Portsea, Melbourne, Australia",
##D          departure_time =  Sys.time() + (24 * 60 * 60),
##D          mode = "transit",
##D          transit_mode = "bus",
##D          transit_routing_preference = "less_walking",
##D          simplify = FALSE)
##D 
##D ## using arrival time
##D res <- google_directions(origin = "Melbourne Airport, Australia",
##D          destination = "Portsea, Melbourne, Australia",
##D          arrival_time =  Sys.time() + (24 * 60 * 60),
##D          mode = "transit",
##D          transit_mode = "bus",
##D          transit_routing_preference = "less_walking",
##D          simplify = FALSE)
##D 
##D ## return results in French
##D res <- google_directions(origin = "Melbourne Airport, Australia",
##D          destination = "Portsea, Melbourne, Australia",
##D          arrival_time =  Sys.time() + (24 * 60 * 60),
##D          mode = "transit",
##D          transit_mode = "bus",
##D          transit_routing_preference = "less_walking",
##D          language = "fr",
##D          simplify = FALSE)
##D 
## End(Not run)



