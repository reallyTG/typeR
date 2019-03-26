library(spatial.tools)


### Name: modify_raster_margins
### Title: Add/subtract rows and columns from Raster*
### Aliases: modify_raster_margins

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
dim(tahoe_highrez)
# Remove one row and column from the top, bottom, left, and right:
tahoe_highrez_cropped <- modify_raster_margins(x=tahoe_highrez,extent_delta=c(-1,-1,-1,-1))
dim(tahoe_highrez_cropped)
# Add two rows to the top and left of the raster, and fill with the value 100.
tahoe_highrez_expand <- modify_raster_margins(x=tahoe_highrez,extent_delta=c(2,0,2,0),value=100)
dim(tahoe_highrez_expand)



