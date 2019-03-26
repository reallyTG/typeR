library(wavethresh)


### Name: accessD.wd
### Title: Get detail (mother wavelet) coefficients from wavelet object
###   (wd).
### Aliases: accessD.wd
### Keywords: manip

### ** Examples

#
# Get the 4th resolution level of wavelet coefficients. 
#
dat <- rnorm(128)
accessD(wd(dat), level=4)



