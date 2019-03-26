library(lawn)


### Name: lawn_bezier
### Title: Curve a linestring
### Aliases: lawn_bezier

### ** Examples

pts <- '[
   [-21.964416, 64.148203],
   [-21.956176, 64.141316],
   [-21.93901, 64.135924],
   [-21.927337, 64.136673]
]'
lawn_bezier(lawn_linestring(pts))
lawn_bezier(lawn_linestring(pts), 9000L)
lawn_bezier(lawn_linestring(pts), 9000L, 0.65)
## Not run: 
##D lawn_bezier(lawn_linestring(pts)) %>% view
##D lawn_featurecollection(list(lawn_linestring(pts),
##D   lawn_bezier(lawn_linestring(pts)))) %>% view
## End(Not run)



