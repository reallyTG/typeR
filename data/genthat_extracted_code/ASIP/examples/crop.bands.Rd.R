library(ASIP)


### Name: crop.bands
### Title: Cropping of satellite image bands
### Aliases: crop.bands

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
path <- system.file ("TM_sample", package = "ASIP")
shapefil <- paste0 (path, "/test.shp")
# Assign 0 values to band names which are not required
crop.bands (path, crop = "f", ext2crop = shapefil, b3=0, b4=0, b5=0, b6 = 0, b7 = 0)



