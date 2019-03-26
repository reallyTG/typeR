library(wvtool)


### Name: noise.filter
### Title: Median, Mean and Gaussian Filter
### Aliases: noise.filter

### ** Examples

data(camphora)
camphora <- crop(camphora,200,200)
par(mfrow=c(2,2))
image(rot90c(noise.filter(camphora,3,"median")),col=gray(c(0:255)/255), 
main="median", useRaster=TRUE, axes=FALSE, asp=1)
image(rot90c(noise.filter(camphora,3,"mean")),col=gray(c(0:255)/255), 
main="mean", useRaster=TRUE, axes=FALSE, asp=1)
image(rot90c(noise.filter(camphora,3,"gaussian")),col=gray(c(0:255)/255), 
main="gaussian", useRaster=TRUE, axes=FALSE, asp=1)



