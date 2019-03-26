library(pgirmess)


### Name: writePRJ
### Title: Write the projection file of a shapefile from a spatial object
### Aliases: writePRJ
### Keywords: IO connection

### ** Examples


library(sp)
mypoints<-data.frame(long=runif(10,-90,+90),lat=runif(10,-90,+90))
coordinates(mypoints)<-~long+lat # SpatialPoints object
proj4string(mypoints)<-CRS("+proj=longlat +ellps=WGS84 +datum=WGS84") # WGS84 coordinates
writePRJ(mypoints,"")




