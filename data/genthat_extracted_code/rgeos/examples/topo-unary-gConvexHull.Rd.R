library(rgeos)


### Name: gConvexHull
### Title: Convex Hull of Geometry
### Aliases: gConvexHull RGEOSConvexHull
### Keywords: spatial

### ** Examples

x = readWKT(paste("POLYGON((0 40,10 50,0 60,40 60,40 100,50 90,60 100,60",
 "60,100 60,90 50,100 40,60 40,60 0,50 10,40 0,40 40,0 40))"))

ch = gConvexHull(x)

plot(x,col='blue',border='blue')
plot(ch,add=TRUE)



