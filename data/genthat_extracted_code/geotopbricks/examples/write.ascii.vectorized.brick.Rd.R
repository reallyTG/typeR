library(geotopbricks)


### Name: write.ascii.vectorized.brick
### Title: Writes a z-layer brick referred to a time instant (e.g. date) in
###   an ascii format like "geotop.inpts" file.
### Aliases: write.ascii.vectorized.brick

### ** Examples

## Not Run
## library(geotopbricks)
## library(raster)
## file <- system.file("doc/examples/snowthickness",package="geotopbricks")
## file <- paste(file,"SnowThickness0000L%04d.asc",sep="/")
## b <- brick.decimal.formatter(file=file,nlayers=15)
## nlayers(b)
## names(b)
## file <- "snow.txt"
## btext <- write.ascii.vectorized.brick(b,Date="1/1/2009",file="snow.txt")
## The printed object
## str(btext)
## bb <- read.ascii.vectorized.brick(file = file) 
## bf <- abs(as.matrix(bb[[1]]-b[[1]]))<.Machine$double.eps^0.5



