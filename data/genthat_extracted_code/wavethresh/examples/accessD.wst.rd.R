library(wavethresh)


### Name: accessD.wst
### Title: Get mother wavelet coefficients from a packet ordered
###   non-decimated wavelet object (wst).
### Aliases: accessD.wst
### Keywords: manip

### ** Examples

#
# Get the 4th level of mother wavelet coefficients from a decomposition
#
dat <- rnorm(128)
accessD(wst(dat), level=4)



