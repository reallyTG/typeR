library(lawn)


### Name: lawn_along
### Title: Get a point at a distance along a line
### Aliases: lawn_along

### ** Examples

pts <- '[
   [-21.964416, 64.148203],
   [-21.956176, 64.141316],
   [-21.93901, 64.135924],
   [-21.927337, 64.136673]
]'
lawn_along(lawn_linestring(pts), 1, 'miles')

line <- '{
"type": "Feature",
"properties": {},
"geometry": {
  "type": "LineString",
  "coordinates": [
    [-77.031669, 38.878605],
    [-77.029609, 38.881946],
    [-77.020339, 38.884084],
    [-77.025661, 38.885821],
    [-77.021884, 38.889563],
    [-77.019824, 38.892368]
    ]
 }
}'
lawn_along(line, distance = 1, units = 'miles')
## Not run: 
##D lawn_along(lawn_linestring(pts), 1, 'miles') %>% view
##D res <- lawn_along(lawn_linestring(pts), 1, 'miles')
##D lawn_featurecollection(list(res, lawn_linestring(pts))) %>% view
## End(Not run)



