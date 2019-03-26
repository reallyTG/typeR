library(lawn)


### Name: lawn_destination
### Title: Calculate destination point
### Aliases: lawn_destination

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
lawn_destination(pt, 50, 90, "miles")
lawn_destination(pt, 100, 90, "miles")
lawn_destination(pt, 2, 45, "kilometers")
lawn_destination(pt, 2, 30, "degrees")
## Not run: 
##D pt %>% view
##D lawn_destination(pt, 200, 90, "miles") %>% view
## End(Not run)



