library(LS2Wstat)


### Name: cropimage
### Title: Crops a rectangular image to a specified (square) dimension
### Aliases: cropimage
### Keywords: manip

### ** Examples

#
#Create an image with dimensions not a power of two
#
testimage <- matrix(rnorm(300^2),nrow=300,ncol=300)
#
#Crop the image
#
Newimage <- cropimage(testimage)
#
# Check new dimension size.
#
dim(Newimage)
#        



