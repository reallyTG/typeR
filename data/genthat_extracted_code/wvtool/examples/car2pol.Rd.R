library(wvtool)


### Name: car2pol
### Title: Polar Transformer -Cartesian to Polar Coordinates-
### Aliases: car2pol

### ** Examples

data(camphora)
par(mfrow=c(1,2))
image(rot90c(camphora), col=gray(c(0:255)/255), main="camphora, original", 
	    useRaster=TRUE, asp=1, axes=FALSE)
img <- car2pol(camphora, method="bilinear")
image(rot90c(img), col=gray(c(0:255)/255), main="camphora, polar (bilinear)", 
xlab="radial distance(pixel)",ylab="angle(deg)", useRaster=TRUE, asp=1, axes=FALSE)



