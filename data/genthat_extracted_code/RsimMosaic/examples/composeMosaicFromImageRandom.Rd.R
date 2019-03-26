library(RsimMosaic)


### Name: composeMosaicFromImageRandom
### Title: Randomly transform an image into a mosaic
### Aliases: composeMosaicFromImageRandom
### Keywords: methods

### ** Examples

# Set the filename of the original image
#origImgFileN <- system.file("extdata", "verySmallMoon.jpg", package="RsimMosaic") 
origImgFileN <- system.file("extdata", "reallyVerySmallMoon.jpg", package="RsimMosaic") 

# Set the folder where the tiles library is located
pathToTileLib <- system.file("extdata/2Massier", package="RsimMosaic")

# Set the filename of the output image (the mosaic!)
outImgFileN <- file.path(tempdir(), "verySmallMoon-2MASS-Mosaic.jpg")

# Create the mosaic
composeMosaicFromImageRandom(origImgFileN, outImgFileN, pathToTileLib, removeTiles=FALSE)




