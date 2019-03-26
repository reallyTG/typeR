library(geostatsp)


### Name: swissRainR
### Title: Raster of Swiss rain data
### Aliases: swissRainR swissNN
### Keywords: datasets

### ** Examples

## Not run: 
##D library('raster')
##D border = raster::getData('GADM',country='CHE',level=0)
##D 
##D myextent = extent(5 ,12,45,49)
##D 
##D theres=10
##D rain = raster::getData('worldclim', var='prec',
##D 	res=theres,mask=FALSE)#,lon=20,lat=47)
##D rain = raster::crop(rain,myextent)
##D plot(rain[['prec3']])
##D plot(border,add=TRUE)
##D 
##D alt = raster::getData('worldclim', var='alt',res=theres)
##D alt = raster::crop(alt,extent(rain))
##D plot(alt)
##D plot(border,add=TRUE)
##D 
##D 
##D bio = raster::getData('worldclim', var='bio',res=theres)
##D bio = raster::crop(bio,extent(rain))
##D plot(alt)
##D plot(border,add=TRUE)
##D 
##D swissRainR = rain
##D #	rain[[c('prec2','prec7')]]
##D swissRainR = addLayer(swissRainR,alt)	
##D 
##D library('geostatsp')
##D swissNN = NNmat(swissRainR)
##D 	
##D save(swissRainR, swissNN,file=
##D "/home/patrick/workspace/diseasemapping/pkg/gmrf/data/swissRainR.RData",
##D compress='xz'	)	
##D 
## End(Not run)
data('swissRainR')
plot(swissRainR[['prec7']])

plot(swissRainR[['alt']])

swissNN[1:4,1:5]




