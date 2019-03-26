library(spatial.tools)


### Name: fix_extent
### Title: Forces a list of Raster*s to all have the same extent.
### Aliases: fix_extent

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
tahoe_highrez
tahoe_highrez_broken <- tahoe_highrez
# We'll "break" the extent:
extent(tahoe_highrez_broken) <- c(0,360,-90,90)
tahoe_highrez_broken
tahoe_highrez_fixed <- fix_extent(tahoe_highrez,tahoe_highrez_broken)
tahoe_highrez_fixed




