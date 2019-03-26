library(geotopbricks)


### Name: writeRasterxGEOtop
### Title: This function uses 'writeRaster' to create .asc maps which can
###   be read by GEOtop
### Aliases: writeRasterxGEOtop

### ** Examples


library(geotopbricks)

## Simulation working path

file <- system.file("rendena100/SnowDepthMapFile-2014-MA-mean-winter-2013-2014.asc",
package="geotopbricks")
snow <- raster(file)


snowfile <- "./temporary/snow.asc"

dir.create("./temporary")
writeRasterxGEOtop(x=snow,file=snowfile)






