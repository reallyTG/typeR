library(wavethresh)


### Name: imwr.imwdc
### Title: Inverse two-dimensional discrete wavelet transform.
### Aliases: imwr.imwdc
### Keywords: nonlinear smooth

### ** Examples

#
# Do a decomposition, thresholding, then exact reconstruction
# Look at the error
#

test.image <- matrix(rnorm(32*32), nrow=32)

# Test image is just some sort of  square matrix whose side length
# is a power of two.
#
max( abs(imwr(threshold(imwd(test.image))) - test.image))
# [1] 62.34
#
# The answer is not zero (see contrasting examples in the help page for
# imwr.imwd because we have thresholded the
# 2D wavelet transform here).



