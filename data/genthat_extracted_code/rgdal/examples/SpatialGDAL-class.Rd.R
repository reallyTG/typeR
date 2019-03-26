library(rgdal)


### Name: SpatialGDAL-class
### Title: Class "SpatialGDAL"
### Aliases: SpatialGDAL-class SpatialGDALWrite-class [,SpatialGDAL-method
###   summary,SpatialGDAL-method open.SpatialGDAL copy.SpatialGDAL
###   close.SpatialGDAL print.summary.SpatialGDAL
###   coerce,SpatialGDAL,SpatialGridDataFrame-method
###   coerce,SpatialGDAL,SpatialPixelsDataFrame-method $,SpatialGDAL-method
###   [<-,SpatialGDALWrite-method [[,SpatialGDAL,ANY,missing-method
###   $<-,SpatialGDAL-method [[<-,SpatialGDAL,ANY,missing-method
### Keywords: classes

### ** Examples

x <- open.SpatialGDAL(system.file("external/test.ag", package="sp")[1])
image(x[])
image(as(x, "SpatialGridDataFrame"))
summary(as(x, "SpatialGridDataFrame"))
spplot(as(x, "SpatialGridDataFrame"))
# select first 50 rows:
summary(x[1:50])
# select first 50 columns:
summary(x[,1:50])
# select band 1:
summary(x[,,1])
# select first 50 rows, first 50 columns, band 1:
summary(x[1:50,1:50,1])
# get values of first band:
summary(x[[1]])
close(x)



