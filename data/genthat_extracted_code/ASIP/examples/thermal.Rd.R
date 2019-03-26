library(ASIP)


### Name: thermal
### Title: TIR bands to at satellite brightness temperature conversion
### Aliases: thermal

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
path <- system.file ("TM_sample", package = "ASIP")
shapefil <- paste0 (path, "/test.shp")
thermal (directory = path, crop = "y", ext2crop = shapefil, unit = "c")



