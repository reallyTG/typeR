library(googleway)


### Name: google_map_directions
### Title: Google Map Directions
### Aliases: google_map_directions

### ** Examples

## Not run: 
##D 
##D google_map_directions(origin = "Google Pyrmont NSW",
##D   destination = "QVB, Sydney", destination_place_id = "ChIJISz8NjyuEmsRFTQ9Iw7Ear8",
##D   travel_mode = "walking")
##D 
##D 
##D google_map_directions(origin = "Melbourne Cricket Ground",
##D   destination = "Flinders Street Station",
##D   dir_action = "navigate")
##D 
##D google_map_directions(origin = "Melbourne Cricket Ground",
##D   destination = "Flinders Street Station",
##D   travel_mode = "walking",
##D   waypoints = list("National Gallery of Victoria", c(-37.820860, 144.961894)))
##D 
##D 
##D google_map_directions(origin = "Paris, France",
##D   destination = "Cherbourg, France",
##D   travel_mode = "driving",
##D   waypoints = list("Versailles, France", "Chartres, France", "Le Mans, France",
##D     "Caen, France"))
##D 
##D 
##D google_map_directions(origin = "Paris, France",
##D   destination = "Cherbourg, France",
##D   travel_mode = "driving",
##D   waypoints = list("Versailles, France", "Chartres, France", "Le Mans, France",
##D     "Caen, France"),
##D   waypoint_place_ids = list("ChIJdUyx15R95kcRj85ZX8H8OAU",
##D   "ChIJKzGHdEgM5EcR_OBTT3nQoEA", "ChIJG2LvQNCI4kcRKXNoAsPi1Mc", "ChIJ06tnGbxCCkgRsfNjEQMwUsc"))
##D 
## End(Not run)




