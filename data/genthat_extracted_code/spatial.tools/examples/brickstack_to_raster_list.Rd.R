library(spatial.tools)


### Name: brickstack_to_raster_list
### Title: Converts a RasterBrick/RasterStack to a list of RasterLayers
### Aliases: brickstack_to_raster_list

### ** Examples

# You can speed this up if a parallel backend is running, e.g.:
# sfQuickInit()
library("foreach")
library("raster")
registerDoSEQ() # Just to avoid the warning from foreach.
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
tahoe_highrez_list <- brickstack_to_raster_list(tahoe_highrez)
tahoe_highrez_list
# sfQuickStop()



