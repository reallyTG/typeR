library(RsimMosaic)


### Name: RsimMosaic-package
### Title: R Simple IMage Mosaic creation library
### Aliases: RsimMosaic-package RsimMosaic
### Keywords: package

### ** Examples

# This example will transform an image of the Moon into a mosaic
# composed by objects from the Messier catalogue. The tiles were
# created from the images of the 2MASS catalogue.
# 
# Set the filename of the original image
#origImgFileN <- system.file("extdata", "verySmallMoon.jpg", package="RsimMosaic") 
origImgFileN <- system.file("extdata", "reallyVerySmallMoon.jpg", package="RsimMosaic") 

# Set the folder where the tiles library is located
pathToTileLib <- system.file("extdata/2Massier", package="RsimMosaic")

# Set the filename of the output image (the mosaic!)
outImgFileN <- file.path(tempdir(), "verySmallMoon-2MASS-Mosaic.jpg")

# Create the mosaic
composeMosaicFromImageRandom(origImgFileN, outImgFileN, pathToTileLib, removeTiles=FALSE)



