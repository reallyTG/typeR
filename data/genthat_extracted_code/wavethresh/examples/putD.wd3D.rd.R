library(wavethresh)


### Name: putD.wd3D
### Title: Put wavelet coefficient array into a 3D wavelet object
### Aliases: putD.wd3D
### Keywords: manip

### ** Examples

#
# Generate some test data
#
a <- array(rnorm(8*8*8), dim=c(8,8,8))
#
# Perform the 3D DWT
#
awd3D <- wd3D(a)
#
# Replace the second level coefficients by uniform random variables
# in block GGG (for some reason)
#
#
newsubarray <- list(a = array(runif(4*4*4), dim=c(4,4,4)), lev=2, block="GGG")
awd3D <- putD(awd3D,  v=newsubarray)



