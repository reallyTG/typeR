library(wvtool)


### Name: edge.detect
### Title: Canny and Sobel Edge detector.
### Aliases: edge.detect

### ** Examples

## Not run: 
##D data(camphora)	
##D data(cryptomeria)
##D cryptomeria <- rgb2gray(cryptomeria)
##D img.c1 <- crop(camphora,200,200)
##D img.c2 <- crop(cryptomeria,300,300)
##D par(mfrow=c(2,2))
##D image(rot90c(edge.detect(img.c1,thresh1=1, thresh2=15, noise="gaussian", noise.s=3,
##D  method="Canny")),col=gray(c(0:255)/255), main="Canny", useRaster=TRUE, axes=FALSE, asp=1)
##D image(rot90c(edge.detect(img.c1,thresh1=1, thresh2=15, noise="gaussian", noise.s=3,
##D  method="Sobel")),col=gray(c(0:255)/255), main="Sobel", useRaster=TRUE, axes=FALSE, asp=1)
##D image(rot90c(edge.detect(img.c2,thresh1=1, thresh2=15, noise="gaussian", noise.s=3,
##D  method="Canny")),col=gray(c(0:255)/255), main="Canny", useRaster=TRUE, axes=FALSE, asp=1)
##D image(rot90c(edge.detect(img.c2,thresh1=1, thresh2=15, noise="gaussian", noise.s=3,
##D  method="Sobel")),col=gray(c(0:255)/255), main="Sobel", useRaster=TRUE, axes=FALSE, asp=1)
## End(Not run)



