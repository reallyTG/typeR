library(rgdal)


### Name: GDALTransientDataset-class
### Title: Class "GDALTransientDataset"
### Aliases: GDALTransientDataset-class
###   initialize,GDALTransientDataset-method
### Keywords: classes

### ** Examples

list.files(tempdir())
x <- new('GDALTransientDataset', driver=new('GDALDriver', "GTiff"), rows=100,
 cols=100, bands=3, type='Byte')
dim(x)
list.files(tempdir())
GDAL.close(x)
list.files(tempdir())



