library(mapmisc)


### Name: omerc
### Title: Oblique Mercator, Cylindrical, and Mollweide projections
### Aliases: omerc moll ocea

### ** Examples


omerc(c(10,50), angle=c(0,45,80))

data('netherlands')

if(require('rgdal', quietly=TRUE)){
nldUtm = spTransform(nldCities,
	omerc(nldCities, angle=0))
projection(nldUtm)

map.new(nldUtm)
text(nldUtm,labels=nldUtm$name)
scaleBar(nldUtm, 'topright')

nldRot = spTransform(nldCities,
omerc(nldCities, angle=seq(25,45,by=5))
)
projection(nldRot)

map.new(nldRot)
text(nldRot,labels=nldRot$name)
scaleBar(nldRot, 'topright')
insetMap(nldRot, 'bottomright',map=world)

}
## Not run: 
##D 
##D 	nldOceaCrs = ocea(nldCities)
##D 	nldOcea = spTransform(nldCities, nldOceaCrs)
##D 	map.new(nldOcea, buffer=2000)
##D 	text(nldOcea,labels=nldOcea$name)
##D 	scaleBar(nldOcea, 'topright')
##D 
##D 	map.new(nldCities)
##D 	plot(nldTiles,add=TRUE)
##D 	text(nldCities,labels=nldCities$name)
##D 
##D 	tilesRot = openmap(nldRot)
##D 	map.new(nldRot)
##D 	plot(tilesRot,add=TRUE)
##D 	text(nldRot,labels=nldRot$name)
##D 	
##D 	tilesUtm = openmap(nldUtm)
##D 	map.new(nldUtm)
##D 	plot(tilesUtm,add=TRUE)
##D 	text(nldUtm,labels=nldUtm$name)
##D 
## End(Not run)




