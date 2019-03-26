library(rgeos)


### Name: gCentroid
### Title: Centroid of Geometry
### Aliases: gCentroid RGEOSGetCentroid
### Keywords: spatial

### ** Examples


x = readWKT(paste("GEOMETRYCOLLECTION(POLYGON((0 0,10 0,10 10,0 10,0 0)),",
 "POLYGON((15 0,25 15,35 0,15 0)))"))

# Centroids of both the square and circle independently
c1 = gCentroid(x,byid=TRUE) 
# Centroid of square and circle together
c2 = gCentroid(x)

plot(x)
plot(c1,col='red',add=TRUE)
plot(c2,col='blue',add=TRUE)



