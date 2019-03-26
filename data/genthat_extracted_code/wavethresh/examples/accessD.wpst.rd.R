library(wavethresh)


### Name: accessD.wpst
### Title: Get coefficients from a non-decimated wavelet packet object
###   (wpst) in time order.
### Aliases: accessD.wpst
### Keywords: manip

### ** Examples

#
# Get the 4th level of coefficients from a decomposition
#
dat <- rnorm(128)
accessD(wpst(dat), level=4, index=3)



