library(lawn)


### Name: lawn_polygon
### Title: Create a polygon
### Aliases: lawn_polygon

### ** Examples

rings <- list(list(
   c(-2.275543, 53.464547),
   c(-2.275543, 53.489271),
   c(-2.215118, 53.489271),
   c(-2.215118, 53.464547),
   c(-2.275543, 53.464547)
))
lawn_polygon(rings)
lawn_polygon(rings, properties = list(name = 'poly1', population = 400))

# Make a FeatureCollection
lawn_featurecollection(lawn_polygon(rings))

## Not run: 
##D lawn_featurecollection(lawn_polygon(rings)) %>% view
## End(Not run)



