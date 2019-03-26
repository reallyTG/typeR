library(rgeos)


### Name: gLength
### Title: Length of Geometry
### Aliases: gLength RGEOSLength
### Keywords: spatial

### ** Examples

gLength(readWKT("POINT(1 1)"))

gLength(readWKT("LINESTRING(0 0,1 1,2 2)"))
gLength(readWKT("LINESTRING(0 0,1 1,2 0,3 1)"))

gLength(readWKT("POLYGON((0 0,3 0,3 3,0 3,0 0))"))
gLength(readWKT("POLYGON((0 0,3 0,3 3,0 3,0 0),(1 1,2 1,2 2,1 2,1 1))"))



