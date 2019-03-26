library(rgdal)


### Name: GDALDriver-class
### Title: Class "GDALDriver": GDAL Driver Object
### Aliases: GDALDriver-class getGDALDriverNames gdalDrivers getDriverName
###   getDriverLongName initialize,GDALDriver-method getGDALVersionInfo
###   getGDAL_DATA_Path getGDALCheckVersion getGDALwithGEOS
###   getCPLConfigOption setCPLConfigOption rgdal_extSoftVersion
### Keywords: classes

### ** Examples

gdalDrivers()
logo <- system.file("pictures/logo.jpg", package="rgdal")[1]
x <- new("GDALReadOnlyDataset", logo)
getDriver(x)
getDriverLongName(getDriver(x))
GDAL.close(x)



