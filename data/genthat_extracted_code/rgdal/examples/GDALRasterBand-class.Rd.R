library(rgdal)


### Name: GDALRasterBand-class
### Title: Class "GDALRasterBand"
### Aliases: GDALRasterBand-class getRasterData getRasterTable
###   getProjectionRef initialize,GDALRasterBand-method
###   dim,GDALRasterBand-method getRasterBand getRasterBlockSize toSigned
###   toUnSigned get_OVERRIDE_PROJ_DATUM_WITH_TOWGS84
###   set_OVERRIDE_PROJ_DATUM_WITH_TOWGS84
### Keywords: classes

### ** Examples

logo <- system.file("pictures/logo.jpg", package="rgdal")[1]
x <- new("GDALReadOnlyDataset", logo)
plot(density(getRasterTable(x)$band1))
GDAL.close(x)



