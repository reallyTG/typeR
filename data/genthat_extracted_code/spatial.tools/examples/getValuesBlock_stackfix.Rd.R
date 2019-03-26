library(spatial.tools)


### Name: getValuesBlock_stackfix
### Title: Get a block of raster cell values (optimization fix for
###   RasterStacks)
### Aliases: getValuesBlock_stackfix

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
tahoe_highrez_stack <- stack(tahoe_highrez,tahoe_highrez,tahoe_highrez)
# getValuesBlock stack extraction:
system.time(tahoe_highrez_extract <- getValuesBlock(tahoe_highrez_stack))
# getValuesBlock_stackfix stack extraction:
system.time(tahoe_highrez_extract <- getValuesBlock_stackfix(tahoe_highrez_stack))



