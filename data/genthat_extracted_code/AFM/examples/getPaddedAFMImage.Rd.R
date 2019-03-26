library(AFM)


### Name: getPaddedAFMImage
### Title: Get a zero padded AFMImage
### Aliases: getPaddedAFMImage

### ** Examples

library(AFM)

data(AFMImageOfNormallyDistributedHeights)
paddedAFMImage<-getPaddedAFMImage(AFMImageOfNormallyDistributedHeights)
displayIn3D(AFMImage= paddedAFMImage, width= 1024,noLight=TRUE)



