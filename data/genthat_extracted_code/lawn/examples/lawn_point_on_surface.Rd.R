library(lawn)


### Name: lawn_point_on_surface
### Title: Get a point on the surface of a feature
### Aliases: lawn_point_on_surface

### ** Examples

# polygon
x <- lawn_random("polygon")
lawn_point_on_surface(x)
# point
x <- lawn_random("point")
lawn_point_on_surface(x)
# linestring
linestring <- '[
   [-21.929054, 64.127985],
   [-21.912918, 64.134726],
   [-21.916007, 64.141016],
   [-21.930084, 64.14446]
]'
lawn_point_on_surface(lawn_linestring(linestring))



