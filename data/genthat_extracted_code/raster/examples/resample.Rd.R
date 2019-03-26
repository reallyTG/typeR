library(raster)


### Name: resample
### Title: Resample a Raster object
### Aliases: resample resample,Raster,Raster-method
### Keywords: spatial

### ** Examples

r <- raster(nrow=3, ncol=3)
r[] <- 1:ncell(r)
s <- raster(nrow=10, ncol=10)
s <- resample(r, s, method='bilinear')
#par(mfrow=c(1,2))
#plot(r)
#plot(s)



