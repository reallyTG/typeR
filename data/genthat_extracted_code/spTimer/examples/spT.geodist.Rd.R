library(spTimer)


### Name: spT.geodist
### Title: Geodetic/geodesic Distance
### Aliases: spT.geodist spT.geo.dist spT.geo_dist
### Keywords: utility

### ** Examples

##

# Load 28 ozone monitoring locations of New York.
data(NYdata)	
head(NYdata)
NYsite<-unique(NYdata[,1:3])	

# Find the geodetic distance in km
spT.geodist(Lon=NYsite$Longitude, Lat=NYsite$Latitude, KM=TRUE)
   
# Find the geodetic distance in miles
spT.geodist(Lon=NYsite$Longitude, Lat=NYsite$Latitude, KM=FALSE)

##

# using spT.geo.dist
point1<-c(-73.757,42.681)
point2<-c(-73.881,40.866)
spT.geo.dist(point1,point2)

# using spT.geo_dist
points<-c(point1,point2)
spT.geo_dist(points)

##



