library(lawn)


### Name: lawn_intersect
### Title: Intersection
### Aliases: lawn_intersect

### ** Examples

## Not run: 
##D poly1 <- '{
##D  "type": "Feature",
##D  "properties": {
##D    "fill": "#0f0"
##D  },
##D  "geometry": {
##D    "type": "Polygon",
##D    "coordinates": [[
##D      [-122.801742, 45.48565],
##D      [-122.801742, 45.60491],
##D      [-122.584762, 45.60491],
##D      [-122.584762, 45.48565],
##D      [-122.801742, 45.48565]
##D     ]]
##D  }
##D }'
##D 
##D poly2 <- '{
##D  "type": "Feature",
##D  "properties": {
##D    "fill": "#00f"
##D  },
##D  "geometry": {
##D    "type": "Polygon",
##D    "coordinates": [[
##D      [-122.520217, 45.535693],
##D      [-122.64038, 45.553967],
##D      [-122.720031, 45.526554],
##D      [-122.669906, 45.507309],
##D      [-122.723464, 45.446643],
##D      [-122.532577, 45.408574],
##D      [-122.487258, 45.477466],
##D      [-122.520217, 45.535693]
##D      ]]
##D  }
##D }'
##D lawn_intersect(poly1, poly2)
##D 
##D view(poly1)
##D view(poly2)
##D lawn_intersect(poly1, poly2) %>% view()
##D 
##D x1 <- lawn_buffer(lawn_point(c(-122.6375, 45.53)), 1500, "meters")
##D x2 <- lawn_buffer(lawn_point(c(-122.6475, 45.53)), 1500, "meters")
##D lawn_intersect(x1, x2)
##D structure(x1, class = "featurecollection") %>% view()
##D structure(x2, class = "featurecollection") %>% view()
##D lawn_intersect(x1, x2) %>% view()
##D 
##D # not overlapping
##D x3 <- lawn_buffer(lawn_point(c(-122.6375, 45.53)), 1500, "meters")
##D x4 <- lawn_buffer(lawn_point(c(-122.6975, 45.53)), 1500, "meters")
##D structure(x3, class = "featurecollection") %>% view()
##D structure(x4, class = "featurecollection") %>% view()
##D lawn_intersect(x3, x4)
## End(Not run)



