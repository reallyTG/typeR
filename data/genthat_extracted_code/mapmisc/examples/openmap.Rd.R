library(mapmisc)


### Name: openmap
### Title: Download map tiles
### Aliases: openmap osmTiles openmapAttribution

### ** Examples


data("netherlands")

plot(nldTiles)

openmapAttribution(nldTiles, short=TRUE, type='markdown')

openmapAttribution("stamen-toner", type='text')


myraster = raster(matrix(0,10,10),xmn=8,xmx=18,ymn=0,ymx=10, 
  crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")

values(myraster) = seq(0,1,len=ncell(myraster))

myPoints = SpatialPoints(myraster, proj4string=CRS(proj4string(myraster)))[
	seq(1,ncell(myraster),len=5)]

names(osmTiles())


## Not run: 
##D 	mytiles = openmap(myraster, zoom=6)
##D 
##D 	map.new(myraster)
##D 	plot(mytiles, add=TRUE)
##D 	points(myPoints,col='red')
##D 
##D 	mytiles = openmap(myPoints,
##D 		path='waze', verbose=TRUE)
##D 	map.new(myPoints)
##D 	plotRGB(mytiles, add=TRUE)
##D 	points(myPoints, col='red')
##D 	openmapAttribution(mytiles)
## End(Not run)




