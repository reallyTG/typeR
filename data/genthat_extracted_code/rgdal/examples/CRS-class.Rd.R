library(rgdal)


### Name: CRS-class
### Title: Class "CRS" of coordinate reference system arguments
### Aliases: CRS-class CRS CRSargs checkCRSArgs print.CRS show,CRS-method
###   RGDAL_checkCRSArgs
### Keywords: classes spatial

### ** Examples

CRSargs(CRS("+proj=longlat"))
try(CRS("+proj=longlat +no_defs"))
CRSargs(CRS("+proj=longlat +datum=NAD27"))
CRSargs(CRS("+init=epsg:4267"))
CRSargs(CRS("+init=epsg:26978"))
CRSargs(CRS(paste("+proj=stere +lat_0=52.15616055555555", 
"+lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel", 
"+towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812", 
"+units=m")))
# see http://trac.osgeo.org/gdal/ticket/1987
CRSargs(CRS("+init=epsg:28992"))
crs <- CRS("+init=epsg:28992")
CRSargs(CRS(CRSargs(crs)))
library(sp)
data(meuse)
coordinates(meuse) <- c("x", "y")
proj4string(meuse) <- CRS("+init=epsg:28992")
CRSargs(CRS(proj4string(meuse)))



