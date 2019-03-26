library(rgdal)


### Name: GDALMajorObject-class
### Title: Class "GDALMajorObject"
### Aliases: GDALMajorObject-class getDescription
### Keywords: classes

### ** Examples

driver <- new('GDALDriver', as.character(getGDALDriverNames()[1,1]))
driver
rm(driver)
logo <- system.file("pictures/logo.jpg", package="rgdal")[1]
x <- new("GDALReadOnlyDataset", logo)
x
getDescription(x)
dim(x)
GDAL.close(x)




