library(mapmisc)


### Name: modis
### Title: MODIS tiles and projection
### Aliases: modis crsModis modisRaster getModisTiles degreeRaster

### ** Examples


crsModis

myPointLL = SpatialPoints(cbind(c(5:6),10:11), proj4string = crsLL)

if(requireNamespace("rgdal", quietly=TRUE)) {
  getModisTiles(myPointLL)

  getModisTiles(myPointLL, mapmisc::degreeRaster)
}

modisUrl = 	'ftp://ladsweb.nascom.nasa.gov/allData/5/MCD12Q1/2002/001/'

## Not run: 
##D paste(modisUrl,
##D   grep(
##D     paste(getModisTiles(myPointLL)[,'tile'], collapse='|'),
##D     unlist(strsplit(RCurl::getURL(
##D 	    modisUrl,ftp.use.epsv=TRUE,
##D 	    dirlistonly = TRUE), '\n')), 
##D 	  value=TRUE), sep='')
## End(Not run)



