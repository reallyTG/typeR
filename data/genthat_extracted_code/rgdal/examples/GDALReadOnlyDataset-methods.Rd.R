library(rgdal)


### Name: GDALReadOnlyDataset-methods
### Title: subset methods for "GDALReadOnlyDataset"
### Aliases: GDALReadOnlyDataset-methods [,GDALReadOnlyDataset-method
###   ,GDALReadOnlyDataset-method
###   coerce,GDALReadOnlyDataset,SpatialGridDataFrame-method sub.GDROD
### Keywords: classes

### ** Examples

library(grid)
logo <- system.file("pictures/logo.jpg", package="rgdal")[1]
x <- new("GDALReadOnlyDataset", logo)
dim(x)
x.sp = x[20:50, 20:50]
class(x.sp)
summary(x.sp)
spplot(x.sp)
GDAL.close(x)

logo <- system.file("pictures/Rlogo.jpg", package="rgdal")[1]
x.gdal <- new("GDALReadOnlyDataset", logo)
x = x.gdal[,,3]
dim(x)
summary(x)
spplot(x)
spplot(x.gdal[])
GDAL.close(x.gdal)

logo <- system.file("pictures/Rlogo.jpg", package="rgdal")[1]
x.gdal <- new("GDALReadOnlyDataset", logo)
x.as <- as(x.gdal, "SpatialGridDataFrame")
GDAL.close(x.gdal)
summary(x.as)



