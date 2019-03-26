library(ASIP)


### Name: multi.indices
### Title: Produce multiple indices
### Aliases: multi.indices

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
path <- system.file ("TM_sample", package = "ASIP")
shapefil <- paste0 (path, "/test.shp")
multi.indices (path, crop = "f", ext2crop = shapefil, msavi =1, ndvi = 0)



