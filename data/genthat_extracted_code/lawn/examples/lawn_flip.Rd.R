library(lawn)


### Name: lawn_flip
### Title: Flip x,y to y,x, and vice versa
### Aliases: lawn_flip

### ** Examples

# a point
serbia <- '{
  "type": "Feature",
  "properties": {"color": "red"},
  "geometry": {
    "type": "Point",
    "coordinates": [20.566406, 43.421008]
   }
}'
lawn_flip(serbia)

# a featurecollection
pts <- lawn_random("points")
lawn_flip(pts)
## Not run: 
##D lawn_data$points_average %>% view
##D lawn_flip(lawn_data$points_average) %>% view
##D lawn_data$polygons_average %>% view
##D lawn_flip(lawn_data$polygons_average) %>% view
## End(Not run)



