library(plotGoogleMaps)


### Name: mcGoogleMaps
### Title: Create a plot of spatial data on Google Maps, creates and
###   manages per-zoom-level clusters for large amounts of markers
### Aliases: mcGoogleMaps

### ** Examples

# Data preparation
# Point data
data(meuse)
coordinates(meuse)<-~x+y
proj4string(meuse) <- CRS('+init=epsg:28992')

m<-mcGoogleMaps(meuse, zcol='zinc') 




