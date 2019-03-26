library(rgeos)


### Name: bbox2SP
### Title: Converts a bounding box into a SpatialPolygons object.
### Aliases: bbox2SP
### Keywords: utilities

### ** Examples



if (require(rgdal)) {
cities <- readOGR(dsn=system.file("vectors", package = "rgdal")[1], layer="cities")
n<-75
s<-30
w<--40
e<-32
myPoly<-bbox2SP(n,s,e,w)
plot(cities)
plot(myPoly,border="red",add=TRUE)

bb<-bbox(cities)
myPoly<-bbox2SP(bbox=bb,proj4string=CRS(proj4string(cities)))
plot(myPoly,add=TRUE,border="blue")
}





