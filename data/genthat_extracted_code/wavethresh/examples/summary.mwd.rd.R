library(wavethresh)


### Name: summary.mwd
### Title: Use summary() on a mwd object.
### Aliases: summary.mwd
### Keywords: nonlinear smooth

### ** Examples

#
# Generate an mwd object.
#
tmp <- mwd(rnorm(32))
#
# Now get Splus to use summary.mwd
#
summary(tmp)
# Length of original:  32 
# Levels:  4 
# Filter was:  Geronimo Multiwavelets 
# Scaling fns:  2 
# Wavelet fns:  2 
# Prefilter:  default 
# Scaling factor:  2 
# Boundary handling:  periodic 
# Transform type:  wavelet 
# Date:  Tue Nov 16 13:55:26 GMT 1999 



