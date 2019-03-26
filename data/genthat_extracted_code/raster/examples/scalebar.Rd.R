library(raster)


### Name: scalebar
### Title: scalebar
### Aliases: scalebar
### Keywords: spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
plot(r)
scalebar(1000)
scalebar(1000, xy=c(178000, 333500), type='bar', divs=4)



