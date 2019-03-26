library(wvtool)


### Name: rotate.matrix
### Title: Image Rotation by Bilinear Interpolation
### Aliases: rotate.matrix

### ** Examples

data(camphora)
par(mfrow=c(2,2))
r1 <- rotate.matrix(camphora,15, method="simple")
image(rot90c(r1),asp=1,col=grey(c(0:255)/255), main= "simple", 
useRaster=TRUE, axes=FALSE)
r2 <- rotate.matrix(camphora,25, method="NN")
image(rot90c(r2),asp=1,col=grey(c(0:255)/255), main="nearest neighbour", useRaster=TRUE, axes=FALSE)
r3 <- rotate.matrix(camphora,35, method="bilinear")
image(rot90c(r3),asp=1,col=grey(c(0:255)/255),main="bilinear interpolation", 
useRaster=TRUE, axes=FALSE)



