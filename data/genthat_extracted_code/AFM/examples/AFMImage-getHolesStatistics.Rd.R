library(AFM)


### Name: getHolesStatistics
### Title: calculate statistics about holes in a binary image
### Aliases: getHolesStatistics

### ** Examples

## Not run: 
##D library(AFM)
##D 
##D data(AFMImageOfAluminiumInterface)
##D newAFMImage<-copy(AFMImageOfAluminiumInterface)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-multiplyHeightsAFMImage(newAFMImage, multiplier=2)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-filterAFMImage(newAFMImage,  Min=140, Max=300)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D newAFMImage<-makeBinaryAFMImage(newAFMImage)
##D displayIn3D(newAFMImage,noLight=TRUE)
##D 
##D holesStats<-getHolesStatistics(newAFMImage)
##D print(holesStats)
## End(Not run)



