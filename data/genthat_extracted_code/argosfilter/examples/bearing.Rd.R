library(argosfilter)


### Name: bearing
### Title: Bearing between geographical locations
### Aliases: bearing bearingTrack
### Keywords: spatial

### ** Examples

# Bearing between two geographical locations:
lat1<-rnorm(1,80)
lat2<-rnorm(1,80)
lon1<-rnorm(1,20)
lon2<-rnorm(1,20)
bearing(lat1,lat2,lon1,lon2)

# Bearing between a sequence of 10 geographical locations:
lat<-rnorm(10,80)
lon<-rnorm(10,20)
bearingTrack(lat,lon)



