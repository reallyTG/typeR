library(wvtool)


### Name: crop
### Title: Image cropping
### Aliases: crop

### ** Examples

data(camphora)	
par(mfrow=c(2,2))
image(rot90c(camphora),col=gray(c(0:255)/255), main="original", useRaster=TRUE, axes=FALSE, asp=1)
image(rot90c(crop(camphora,200,100)),col=gray(c(0:255)/255),
main="cropped from the center", useRaster=TRUE, axes=FALSE, asp=0.5)
image(rot90c(crop(camphora,200,200)),col=gray(c(0:255)/255),
main="cropped from the center", useRaster=TRUE, axes=FALSE, asp=1)
image(rot90c(crop(camphora,200,200,shift=c(50,50))),col=gray(c(0:255)/255),
main="cropped from shifted position c(50,50)", useRaster=TRUE, axes=FALSE, asp=1)



