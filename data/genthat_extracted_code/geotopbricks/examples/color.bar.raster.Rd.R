library(geotopbricks)


### Name: color.bar.raster
### Title: Graphic Representation of a Color legend of a Raster or
###   GeotopbrickRaster object as a Color bar, inspired by the function
###   written by John Colby
### Aliases: color.bar.raster

### ** Examples

library(geotopbricks)

## Simulation working path

file <- system.file("rendena100/SnowDepthMapFile-2014-MA-mean-winter-2013-2014.asc",
package="geotopbricks")
snow <- raster(file)

min <- 0 # snow depth expressed in millimeters
max <- 2500 # snow depth expressed in millimeters

colors <- terrain.colors(1000)

color.bar.raster(x=snow,col=colors,digits=2)
color.bar.raster(x=snow,col=colors,min=min,max=max,digits=2)




