library(googleway)


### Name: google_places
### Title: Google places
### Aliases: google_places

### ** Examples

## Not run: 
##D 
##D ## query restaurants in Melbourne (will return 20 results)
##D api_key <- 'your_api_key'
##D 
##D res <- google_places(search_string = "Restaurants in Melbourne, Australia",
##D                      key = api_key)
##D 
##D ## use the 'next_page_token' from the previous search to get the next 20 results
##D res_next <- google_places(search_string = "Restaurants in Melbourne, Australia",
##D                           page_token = res$next_page_token,
##D                           key = api_key)
##D 
##D ## search for a specific place type
##D google_places(location = c(-37.817839,144.9673254),
##D               place_type = "bicycle_store",
##D               radius = 20000,
##D               key = api_key)
##D 
##D ## search for places that are open at the time of query
##D  google_places(search_string = "Bicycle shop, Melbourne, Australia",
##D                open_now = TRUE,
##D                key = api_key)
##D 
## End(Not run)



