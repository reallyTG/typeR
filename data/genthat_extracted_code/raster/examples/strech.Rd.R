library(raster)


### Name: stretch
### Title: Stretch
### Aliases: stretch
### Keywords: spatial

### ** Examples

r <- raster(nc=10, nr=10)
r[] <- 1:100 * 10
stretch(r)
s <- stack(r, r*2)
stretch(s)




