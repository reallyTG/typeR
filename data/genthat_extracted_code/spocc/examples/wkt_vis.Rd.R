library(spocc)


### Name: wkt_vis
### Title: Visualize well-known text area's on a map.
### Aliases: wkt_vis

### ** Examples

## Not run: 
##D poly <- 'POLYGON((-111.06 38.84, -110.80 39.37, -110.20 39.17, -110.20 38.90,
##D      -110.63 38.67, -111.06 38.84))'
##D wkt_vis(poly)
##D 
##D poly2 <- 'POLYGON((-125 38.4,-125 40.9,-121.8 40.9,-121.8 38.4,-125 38.4))'
##D wkt_vis(poly2)
##D 
##D # Multiple polygons
##D x <- "POLYGON((-125 38.4, -121.8 38.4, -121.8 40.9, -125 40.9, -125 38.4), 
##D (-115 22.4, -111.8 22.4, -111.8 30.9, -115 30.9, -115 22.4))"
##D wkt_vis(x)
##D 
##D # don't open in browser
##D poly2 <- 'POLYGON((-125 38.4,-125 40.9,-121.8 40.9,-121.8 38.4,-125 38.4))'
##D wkt_vis(poly2, browse = FALSE)
## End(Not run)



