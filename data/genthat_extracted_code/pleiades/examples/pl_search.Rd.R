library(pleiades)


### Name: pl_search
### Title: Search for a place, name or location.
### Aliases: pl_search pl_search_loc pl_search_names pl_search_places

### ** Examples

## Not run: 
##D pl_search()
##D pl_search_loc()
##D pl_search_names()
##D pl_search_places()
##D 
##D pl_search_loc("SELECT * FROM locations limit 5")
##D pl_search_names("SELECT * FROM names limit 5")
##D pl_search_places("SELECT * FROM places limit 5")
##D 
##D library(dplyr)
##D locs <- pl_search("SELECT * FROM locations limit 1000") %>%
##D   select(pid, reprLat, reprLong)
##D nms <- pl_search("SELECT * FROM names limit 1000") %>% select(pid)
##D left_join(locs, nms, "pid", copy = TRUE) %>% collect %>% NROW
## End(Not run)



