library(rgeos)


### Name: gIsRing
### Title: Is Geometry a Ring?
### Aliases: gIsRing RGEOSisRing
### Keywords: spatial

### ** Examples


l1 = readWKT("LINESTRING(0 0, 1 1, 1 0, 0 1, 0 0)")
l2 = readWKT("LINESTRING(0 0,1 0,1 1,0 1,0 0)")
r1 = readWKT("LINEARRING(0 0, 1 1, 1 0, 0 1, 0 0)")
r2 = readWKT("LINEARRING(0 0,1 0,1 1,0 1,0 0)")
p1 = readWKT("POLYGON((0 0, 1 1, 1 0, 0 1, 0 0))")
p2 = readWKT("POLYGON((0 0,1 0,1 1,0 1,0 0))")

par(mfrow=c(3,2))
plot(l1);title(paste("LINESTRING\nRing:",gIsRing(l1)))
plot(l2);title(paste("LINESTRING\nRing:",gIsRing(l2)))
plot(r1);title(paste("LINEARRING\nRing:",gIsRing(r1)))
plot(r2);title(paste("LINEARRING\nRing:",gIsRing(r2)))
plot(p1);title(paste("POLYGON\nRing:",gIsRing(p1)))
plot(p2);title(paste("POLYGON\nRing:",gIsRing(p2)))



