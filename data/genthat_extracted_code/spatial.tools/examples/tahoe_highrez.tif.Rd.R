library(spatial.tools)


### Name: tahoe_highrez.tif
### Title: High resolution false color infrared image from the Lake Tahoe
###   Basin.
### Aliases: tahoe_highrez.tif
### Keywords: data

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
plotRGB(tahoe_highrez)



