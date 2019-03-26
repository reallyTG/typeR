library(ASIP)


### Name: sen2_msi
### Title: Make your own custom Sentinel-2 MSI satellite image products
### Aliases: sen2_msi

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
##path <- system.file ("TM_sample", package = "ASIP")
# Input equation should be as text (inside double quotes)
eqn <- "((2 * b4)+ (b3+pi+b8))/(b3+b4+b8)"
##shapefil <- paste0 (path, "/test.shp")
##op <- custom.eqn (directory = path, cus.formula = eqn, crop = "y", ext2crop = shapefil)



