library(ggmap)


### Name: get_map
### Title: Grab a map.
### Aliases: get_map

### ** Examples

map <- get_map()
map
str(map)
ggmap(map)

## Not run: 
##D # not run by check to reduce time; also,
##D # osm may error due to server overload
##D 
##D (map <- get_map(maptype = "roadmap"))
##D (map <- get_map(source = "osm"))
##D (map <- get_map(source = "stamen", maptype = "watercolor"))
##D 
##D map <- get_map(location = "texas", zoom = 6, source = "stamen")
##D ggmap(map, fullpage = TRUE)
##D 
## End(Not run)



