library(ASIP)


### Name: dn2toa
### Title: DN to TOA conversion of optical bands
### Aliases: dn2toa

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
path <- system.file ("TM_sample", package = "ASIP")
shapefil <- paste0 (path, "/test.shp")
# Assign 0 values to band names which are not required
dn2toa (path, crop = "f", ext2crop = shapefil, b3=0, b4=0, b5=0, b6 = 0, b7 = 0)



