library(geotopbricks)


### Name: brick.decimal.formatter
### Title: Imports a brick of raster ascii maps into a 'brick' object
### Aliases: brick.decimal.formatter

### ** Examples

library(geotopbricks)
library(raster)
file <- system.file("doc/examples/snowthickness",package="geotopbricks")
file <- paste(file,"SnowThickness0000L%04d.asc",sep="/")
# nlayers=15
nlayers <- 6 ## Only 6 layers are read to minimize the elapsed time of the example!!
b <- brick.decimal.formatter(file=file,nlayers=nlayers)
nlayers(b)
names(b)



