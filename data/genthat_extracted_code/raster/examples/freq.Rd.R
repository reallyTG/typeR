library(raster)


### Name: freq
### Title: Frequency table
### Aliases: freq freq,RasterLayer-method freq,RasterStackBrick-method
### Keywords: spatial univar

### ** Examples

r <- raster(nrow=18, ncol=36)
r[] <- runif(ncell(r))
r[1:5] <- NA
r <- r * r * r * 5
freq(r)

freq(r, value=2)

s <- stack(r, r*2, r*3)
freq(s, merge=TRUE)



