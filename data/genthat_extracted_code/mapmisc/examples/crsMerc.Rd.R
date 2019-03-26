library(mapmisc)


### Name: crsMerc
### Title: Spherical Mercator projection
### Aliases: crsMerc crsLL

### ** Examples


crsMerc
if(require('rgdal', quietly=TRUE))
	CRS("+init=epsg:3857")

crsLL
if(require('rgdal', quietly=TRUE)) {
	CRS("+init=epsg:4326")

	rgdal::showEPSG("+proj=longlat")
	rgdal::showEPSG(as.character(crsLL))
}





