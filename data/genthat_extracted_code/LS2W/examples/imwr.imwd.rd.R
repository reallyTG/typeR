library(LS2W)


### Name: imwr.imwd
### Title: Inverse two-dimensional discrete wavelet transform.
### Aliases: imwr.imwd
### Keywords: nonlinear smooth

### ** Examples

#
# Do a decomposition, then exact reconstruction
# Look at the error
#
test.image <- matrix(rnorm(32*32), nrow=32)
#
# Test image is just some sort of  square matrix whose side length
# is a power of two.
#
max( abs(imwr(imwd(test.image)) - test.image))
# [1] 1.014611e-11



