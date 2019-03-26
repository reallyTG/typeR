library(plotGoogleMaps)


### Name: iconlabels
### Title: Create icon markers depending on attribute data.
### Aliases: iconlabels

### ** Examples

# Data preparation
data(meuse)
coordinates(meuse)<-~x+y
proj4string(meuse) <- CRS('+init=epsg:28992')

m<-plotGoogleMaps(meuse,zcol='zinc')

# zinc labels
ic=iconlabels(meuse$zinc, height=12)
m<-plotGoogleMaps(meuse,zcol='zinc', iconMarker=ic)

# landuse labels and markers
ic=iconlabels(meuse$landuse, height=12, colPalette=rainbow(15) )
m<-plotGoogleMaps(meuse,zcol='landuse',colPalette=rainbow(15), iconMarker=ic)

ic=iconlabels(meuse$landuse, height=12, colPalette='#9ECAE1', icon=TRUE)
m<-plotGoogleMaps(meuse,zcol='landuse',colPalette='#9ECAE1', iconMarker=ic)




