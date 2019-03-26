library(mapmisc)


### Name: netherlands
### Title: Data from the Netherlands
### Aliases: netherlands nldElev nldTiles nldCities world
### Keywords: datasets

### ** Examples


# soil data
library("sp")
data("meuse")
coordinates(meuse) <- ~x+y

if(requireNamespace('rgdal', quietly=TRUE)) {
	 proj4string(meuse) <- CRS("+init=epsg:28992")
} else {
 proj4string(meuse) <- CRS(
  paste("+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889",
    "+k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +no_defs"
  )
 )
}

meuse$soilFac = factor(meuse$soil, levels=c(1,2,3), 
	labels=c("Calcareous","Non-Calc's","Red Brick"))
soilCol = colourScale(meuse$soilFac)
	
data("netherlands")

map.new(meuse)
plot(nldTiles,add=TRUE)
points(nldCities)
text(nldCities,label=nldCities$name, pos=2)
points(meuse, pch=16, col=soilCol$plot)
legend('topleft', fill=soilCol$col,legend=soilCol$legend)
if(requireNamespace('rgdal', quietly=TRUE)) insetMap(meuse, "bottomright",map=world)

# location won't be marked on the inset map unless rgdal is available

## Not run: 
##D # this is how the data were obtained
##D 
##D # map tiles
##D nldTiles = openmap(meuse,  zoom=12)
##D 
##D # cities
##D nldCities = GNcities(nldTiles, maxRows=25)
##D 
##D # world
##D world = openmap(extent(-10,30,40,60))
##D 
##D # elevation data
##D require('rgdal')
##D meuseLL = spTransform(meuse, CRS("+init=epsg:4326"))
##D getData("SRTM", lon=xmin(extent(meuseLL)), 
##D 	lat=ymin(extent(meuseLL)),path=tempdir())
##D nldElev = raster(paste(tempdir(), "/", "srtm_38_02.tif", sep=""))
##D nldElev = crop(nldElev, extend(extent(meuseLL), 0.1))
##D nldElev = projectRaster(nldElev, crs=proj4string(meuse))
##D nldElev = crop(nldElev, extent(nldTiles))
##D 
##D # save the files where the package builder wants them
##D # save(nldElev, nldTiles, nldCities,world,
##D #   file="~/workspace/diseasemapping/pkg/mapmisc/data/netherlands.RData",
##D #   compress="xz")
## End(Not run)



