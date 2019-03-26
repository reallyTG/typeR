library(lawn)


### Name: lawn_circle
### Title: circle
### Aliases: lawn_circle

### ** Examples

pt <- '{
  "type": "Feature",
  "properties": {
    "marker-color": "#0f0"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-75.343, 39.984]
  }
}'

lawn_circle(pt, radius = 5, steps = 10)
## Not run: 
##D lawn_circle(pt, radius = 5, steps = 10) %>% view
##D lawn_circle(pt, radius = 4, steps = 10) %>% view
##D lawn_circle(pt, radius = 3, steps = 10) %>% view
##D lawn_circle(pt, radius = 10, steps = 10) %>% view
##D lawn_circle(pt, radius = 5, steps = 5) %>% view
##D lawn_circle(pt, radius = 5, steps = 4) %>% view
## End(Not run)



