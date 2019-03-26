library(wavethresh)


### Name: wd3D
### Title: Three-dimensional discrete wavelet transform
### Aliases: wd3D
### Keywords: smooth nonlinear

### ** Examples

#
# Generate some test data: 512 standard normal observations in an 8x8x8
# array.
#
test.data.3D <- array(rnorm(8*8*8), dim=c(8,8,8))
#
# Now do the 3D wavelet transform
#
tdwd3D <- wd3D(test.data.3D)
#
# See examples explaining  the 3D wavelet transform.
#



