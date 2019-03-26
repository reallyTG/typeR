library(rgeos)


### Name: over
### Title: Find spatial join or intersections
### Aliases: overGeomGeom overGeomGeomDF
### Keywords: spatial

### ** Examples

p1 = readWKT("POLYGON((0 1,0.95 0.31,0.59 -0.81,-0.59 -0.81,-0.95 0.31,0 1))")
p2 = readWKT("POLYGON((2 2,-2 2,-2 -2,2 -2,2 2),(1 1,-1 1,-1 -1,1 -1,1 1))")

overGeomGeom(p1,p2)



