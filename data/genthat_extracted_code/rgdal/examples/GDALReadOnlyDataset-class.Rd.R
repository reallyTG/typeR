library(rgdal)


### Name: GDALReadOnlyDataset-class
### Title: Class "GDALReadOnlyDataset"
### Aliases: GDALReadOnlyDataset-class getDriver GDAL.close GDAL.open
###   getColorTable getGeoTransFunc initialize,GDALReadOnlyDataset-method
###   dim,GDALReadOnlyDataset-method
### Keywords: classes

### ** Examples

logo <- system.file("pictures/logo.jpg", package="rgdal")[1]
x <- new("GDALReadOnlyDataset", logo)
dim(x)
plot(density(getRasterTable(x)$band1))
#displayDataset(x)
#displayDataset(x, col=function(x){rev(cm.colors(x))})
#im <- displayDataset(x, col=function(x){rev(cm.colors(x))}, reset.par=FALSE)
#contour(1:attr(im, "size")[2], 1:attr(im, "size")[1],
# t(attr(im, "index"))[,attr(im, "size")[1]:1], nlevels = 1,
# levels = 100, col = 'black', add = TRUE)
GDAL.close(x)
logo <- system.file("pictures/Rlogo.jpg", package="rgdal")[1]
x <- new("GDALReadOnlyDataset", logo)
dim(x)
#displayDataset(x)
GDAL.close(x)



