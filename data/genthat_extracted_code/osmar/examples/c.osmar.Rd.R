library(osmar)


### Name: c.osmar
### Title: Combine osmar objects
### Aliases: c.osmar

### ** Examples

## Not run: 
##D     muc <- get_osm(center_bbox(11.575278, 48.137222, 200, 200))
##D     o1 <- subset(muc, node_ids = find(muc, node(tags(v == "Marienplatz"))))
##D     o2 <- subset(muc, ids = find_down(muc, way(c(96619179, 105071000))))
##D 
##D     o1
##D     o2
##D     c(o1, o2)
##D   
## End(Not run)



