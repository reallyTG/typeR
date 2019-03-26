library(googleway)


### Name: google_place_details
### Title: Google place details
### Aliases: google_place_details

### ** Examples

## Not run: 
##D ## search for a specific restaurant, Maha, in Melbourne, firstly using google_places()
##D res <- google_places(search_string = "Maha Restaurant, Melbourne, Australia",
##D                      radius = 1000,
##D                      key = key)
##D 
##D ## request more details about the restaurant using google_place_details()
##D google_place_details(place_id = res$results$place_id, key = key)
##D 
## End(Not run)



