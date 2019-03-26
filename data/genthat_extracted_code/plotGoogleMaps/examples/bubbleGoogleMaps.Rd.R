library(plotGoogleMaps)


### Name: bubbleGoogleMaps
### Title: Create a bubble plot of spatial data on Google Maps
### Aliases: bubbleGoogleMaps

### ** Examples

# Data preparation
data(meuse)
coordinates(meuse)<-~x+y
proj4string(meuse) <- CRS('+init=epsg:28992')

m<-bubbleGoogleMaps(meuse,zcol='zinc')

m<-bubbleGoogleMaps(meuse,zcol='cadmium',layerName='Bubble plot - meuse',
                    colPalette=terrain.colors(5),strokeColor='')




