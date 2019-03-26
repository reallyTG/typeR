library(plotGoogleMaps)


### Name: PolyCol
### Title: Create list of colors depending on attribute data.
### Aliases: PolyCol

### ** Examples

# Data preparation
data(meuse)
coordinates(meuse)<-~x+y
proj4string(meuse) <- CRS('+init=epsg:28992')

m<-plotGoogleMaps(meuse,zcol='zinc')
# see results in your working directory

# similar classic plot
cols=PolyCol(meuse$zinc)$cols
plot(meuse,col=cols)

str(PolyCol(meuse$zinc))

m<-plotGoogleMaps(meuse,zcol='zinc',at=c(0,300,600, max(meuse$zinc)), colPalette=rainbow(3))
# similar classic plot
cols=PolyCol(meuse$zinc,colPalette=rainbow(3), at=c(0,300,600, max(meuse$zinc)) )$cols
plot(meuse,col=cols)

# plotKML(meuse, colour='zinc', colour_scale =cols)



