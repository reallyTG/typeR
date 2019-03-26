library(ASIP)


### Name: ndvi
### Title: Normalized Difference Vegetation Index
### Aliases: ndvi

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
path <- system.file ("TM_sample", package = "ASIP")
shapefil <- paste0 (path, "/test.shp")
ndvi (directory = path, crop = "y", ext2crop = shapefil)



