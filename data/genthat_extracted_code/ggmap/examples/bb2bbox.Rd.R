library(ggmap)


### Name: bb2bbox
### Title: Convert a bb specification to a bbox specification
### Aliases: bb2bbox

### ** Examples


## Not run: 
##D  cut down on R CMD check time
##D 
##D # grab a center/zoom map and compute its bounding box
##D gc <- geocode("white house, washington dc")
##D map <- get_map(gc)
##D (bb <- attr(map, "bb"))
##D (bbox <- bb2bbox(bb))
##D 
##D # use the bounding box to get a stamen map
##D stamMap <- get_stamenmap(bbox)
##D 
##D ggmap(map) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D ggmap(stamMap) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D 
## End(Not run)





