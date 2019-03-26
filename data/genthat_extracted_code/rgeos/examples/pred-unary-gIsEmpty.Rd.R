library(rgeos)


### Name: gIsEmpty
### Title: Is Geometry Empty?
### Aliases: gIsEmpty RGEOSisEmpty
### Keywords: spatial

### ** Examples

try(gIsEmpty(readWKT("POINT EMPTY")))
gIsEmpty(readWKT("POINT(1 1)"))
try(gIsEmpty(readWKT("LINESTRING EMPTY")))
gIsEmpty(readWKT("LINESTRING(0 0,1 1)"))
try(gIsEmpty(readWKT("POLYGON EMPTY")))
gIsEmpty(readWKT("POLYGON((0 0,1 0,1 1,0 1,0 0))"))



