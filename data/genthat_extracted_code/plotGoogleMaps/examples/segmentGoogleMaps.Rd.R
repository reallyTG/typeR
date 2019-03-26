library(plotGoogleMaps)


### Name: segmentGoogleMaps
### Title: Create a segment circles - pie charts plot of spatial data on
###   Google Maps, by using two or more related attributes.
### Aliases: segmentGoogleMaps

### ** Examples

# Data preparation
data(meuse)
coordinates(meuse)<-~x+y
proj4string(meuse) <- CRS('+init=epsg:28992')

m<-segmentGoogleMaps(meuse,zcol=c('zinc','lead','copper'))



