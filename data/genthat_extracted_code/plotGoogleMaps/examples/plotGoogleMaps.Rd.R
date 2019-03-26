library(plotGoogleMaps)


### Name: plotGoogleMaps
### Title: Create a plot of spatial data on Google Maps
### Aliases: plotGoogleMaps

### ** Examples

# Data preparation
# Point data
data(meuse)
require(maptools)
coordinates(meuse)<-~x+y
proj4string(meuse) <- CRS('+init=epsg:28992')
# Line data
data(meuse.grid)
coordinates(meuse.grid)<-c('x','y')
meuse.grid<-as(meuse.grid,'SpatialPixelsDataFrame')
im<-as.image.SpatialGridDataFrame(meuse.grid['dist'])
cl<-ContourLines2SLDF(contourLines(im))
proj4string(cl) <- CRS('+init=epsg:28992')

# Create web map of Point data
m<-plotGoogleMaps(meuse) 

# Combine point and line data
mapMeusePoints<- plotGoogleMaps(meuse,add=TRUE,mapTypeId='TERRAIN',filename='myMap2.htm')
mapMeuseCl<- plotGoogleMaps(cl,previousMap=mapMeusePoints,filename='myMap2.htm')
# see results in your working directory



