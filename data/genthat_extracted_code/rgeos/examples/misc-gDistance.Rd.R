library(rgeos)


### Name: gDistance
### Title: Distance between geometries
### Aliases: gDistance RGEOSDistance gWithinDistance RGEOSisWithinDistance
###   RGEOSHausdorffDistance
### Keywords: spatial

### ** Examples


pt1 = readWKT("POINT(0.5 0.5)")
pt2 = readWKT("POINT(2 2)")

p1 = readWKT("POLYGON((0 0,1 0,1 1,0 1,0 0))")
p2 = readWKT("POLYGON((2 0,3 1,4 0,2 0))")

gDistance(pt1,pt2)
gDistance(p1,pt1)
gDistance(p1,pt2)
gDistance(p1,p2)


p3 = readWKT("POLYGON((0 0,2 0,2 2,0 2,0 0))")
p4 = readWKT("POLYGON((0 0,2 0,2 1.9,1.9 2,0 2,0 0))")
p5 = readWKT("POLYGON((0 0,2 0,2 1.5,1.5 2,0 2,0 0))")
p6 = readWKT("POLYGON((0 0,2 0,2 1,1 2,0 2,0 0))")
p7 = readWKT("POLYGON((0 0,2 0,0 2,0 0))")

gDistance(p3,hausdorff=TRUE)
gDistance(p3,p4,hausdorff=TRUE)
gDistance(p3,p5,hausdorff=TRUE)
gDistance(p3,p6,hausdorff=TRUE)
gDistance(p3,p7,hausdorff=TRUE)



