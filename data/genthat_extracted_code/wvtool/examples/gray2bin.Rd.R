library(wvtool)


### Name: gray2bin
### Title: Conversion from Grayscale to Binary Image
### Aliases: gray2bin

### ** Examples

data(camphora)
par(mfrow=c(2,3))
image(rot90c(camphora), col= gray((0:255)/255), main="camphora", asp=1, useRaster=TRUE, axes=FALSE)
out <- gray2bin(camphora, his=TRUE, dis=TRUE)
image(rot90c(out), col= gray((0:255)/255), main="binary image, auto", asp=1, 
useRaster=TRUE, axes=FALSE)
image(rot90c(gray2bin(camphora,auto=FALSE,th=100)), col= gray((0:255)/255), main="binary image, 
thresh=100", asp=1, useRaster=TRUE, axes=FALSE)
image(rot90c(gray2bin(camphora,auto=FALSE,th=180)), col= gray((0:255)/255), main="binary image, 
thresh=180", asp=1, useRaster=TRUE, axes=FALSE)



