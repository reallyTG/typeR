library(lawn)


### Name: lawn_kinks
### Title: Get points at all self-intersections of a polygon
### Aliases: lawn_kinks

### ** Examples

poly <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
   "type": "Polygon",
   "coordinates": [[
      [-12.034835, 8.901183],
      [-12.060413, 8.899826],
      [-12.03638, 8.873199],
      [-12.059383, 8.871418],
      [-12.034835, 8.901183]
    ]]
  }
}'
lawn_kinks(poly)
# lint input object
# lawn_kinks(poly, TRUE)
## Not run: 
##D poly %>% view
##D lawn_kinks(poly) %>% view
## End(Not run)



