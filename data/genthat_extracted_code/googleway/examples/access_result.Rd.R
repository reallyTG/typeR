library(googleway)


### Name: access_result
### Title: Access Result
### Aliases: access_result direction_instructions direction_routes
###   direction_legs direction_steps direction_points direction_polyline
###   distance_origins distance_destinations distance_elements elevation
###   elevation_location geocode_coordinates geocode_address
###   geocode_address_components geocode_place geocode_type place
###   place_next_page place_name place_location place_type place_hours
###   place_open nearest_roads_coordinates

### ** Examples

## Not run: 
##D 
##D apiKey <- "your_api_key"
##D 
##D ## results returned as a list (simplify == TRUE)
##D lst <- google_directions(origin = c(-37.8179746, 144.9668636),
##D                         destination = c(-37.81659, 144.9841),
##D                         mode = "walking",
##D                         key = apiKey,
##D                         simplify = TRUE)
##D 
##D ## results returned as raw JSON character vector
##D js <- google_directions(origin = c(-37.8179746, 144.9668636),
##D                          destination = c(-37.81659, 144.9841),
##D                         mode = "walking",
##D                          key = apiKey,
##D                          simplify = FALSE)
##D 
##D access_result(js, "polyline")
##D 
##D direction_polyline(js)
##D 
## End(Not run)



