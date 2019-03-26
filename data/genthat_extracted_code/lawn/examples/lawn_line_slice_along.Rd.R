library(lawn)


### Name: lawn_line_slice_along
### Title: Slice a line given two points
### Aliases: lawn_line_slice_along

### ** Examples

line <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "LineString",
    "coordinates": [
      [ 7.66845703125, 45.058001435398296 ],
      [ 9.20654296875, 45.460130637921004 ],
      [ 11.348876953125, 44.48866833139467 ],
      [ 12.1728515625, 45.43700828867389 ],
      [ 12.535400390625, 43.98491011404692 ],
      [ 12.425537109375, 41.86956082699455 ],
      [ 14.2437744140625, 40.83874913796459 ],
      [ 14.765625, 40.681679458715635 ]
    ]
  }
}'
lawn_line_slice_along(12.5, 25, line)
## Not run: 
##D line %>% view
##D lawn_line_slice_along(12.5, 25, line) %>% view
## End(Not run)



