library(sp)


### Name: CRS-class
### Title: Class "CRS" of coordinate reference system arguments
### Aliases: CRS-class CRS CRSargs identicalCRS print.CRS show,CRS-method
### Keywords: classes spatial

### ** Examples

CRS()
CRS("")
CRS(as.character(NA))
CRS("+proj=longlat +datum=WGS84")
if (require(rgdal)) {
  print(CRSargs(CRS("+proj=longlat +datum=NAD27")))
  print(CRSargs(CRS("+init=epsg:4267")))
  print(CRSargs(CRS("+init=epsg:26978")))
  print(CRSargs(CRS(paste("+proj=sterea +lat_0=52.15616055555555",
 "+lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel",
 " +towgs84=565.237,50.0087,465.658,-0.406857,0.350733,-1.87035,4.0812 +units=m"))))
  print(CRSargs(CRS("+init=epsg:28992")))
}
# see http://trac.osgeo.org/gdal/ticket/1987



