library(AFM)


### Name: invertBinaryAFMImage
### Title: invert a binary AFMImage
### Aliases: invertBinaryAFMImage

### ** Examples

## Not run: 
##D library(AFM)
##D data(AFMImageOfAluminiumInterface)
##D newAFMImage<-copy(AFMImageOfAluminiumInterface)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-multiplyHeightsAFMImage(newAFMImage, multiplier=2)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-filterAFMImage(newAFMImage,  Min=140, Max=300)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-makeBinaryAFMImage(newAFMImage)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-invertBinaryAFMImage(newAFMImage)
##D displayIn3D(newAFMImage,noLight=TRUE)
## End(Not run)



