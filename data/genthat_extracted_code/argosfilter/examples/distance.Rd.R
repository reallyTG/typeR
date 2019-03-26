library(argosfilter)


### Name: distance
### Title: Great circle distance between geographical coordinates
### Aliases: distance distanceTrack
### Keywords: spatial

### ** Examples

# Distance between two geographical locations
lat1<-rnorm(1,80)
lon1<-rnorm(1,20)
lat2<-rnorm(1,80)
lon2<-rnorm(1,20)
distance(lat1,lat2,lon1,lon2)

# Distance between a sequence of 10 geographical locations:
lat<-rnorm(10,80)
lon<-rnorm(10,20)
distanceTrack(lat,lon)



