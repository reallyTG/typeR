library(wavethresh)


### Name: accessC.wst
### Title: Get smoothed data from packet ordered non-decimated wavelet
###   object (wst)
### Aliases: accessC.wst
### Keywords: manip

### ** Examples

#
# Get the 3rd level of smoothed data from a decomposition
#
dat <- rnorm(64)
accessC(wst(dat), level=3)



