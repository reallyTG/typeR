library(ASIP)


### Name: custom.eqn
### Title: Make your own custom satellite image product
### Aliases: custom.eqn

### ** Examples

library (raster)
library (rgdal)
# Finding the path of the sample satellite image directory.
# User may define paths directly like "/home/ur_folder" or "C:/ur_folder"
path <- system.file ("TM_sample", package = "ASIP")
# Input equation should be as text (inside double quotes)
eqn <- "(2 * red) + (nir/blue)"
shapefil <- paste0 (path, "/test.shp")
op <- custom.eqn (directory = path, cus.formula = eqn, crop = "y", ext2crop = shapefil)



