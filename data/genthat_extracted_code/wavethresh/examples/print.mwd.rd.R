library(wavethresh)


### Name: print.mwd
### Title: Use print() on a mwd object.
### Aliases: print.mwd
### Keywords: utilities

### ** Examples

#
# Generate an mwd object.
#
tmp <- mwd(rnorm(32))
#
# Now get Splus to use print.mwd
#
tmp
# Class 'mwd' : Discrete Multiple Wavelet Transform Object:
#	 ~~~  : List with 10 components with names
#		 C D nlevelsWT ndata filter fl.dbase type bc prefilter date 
# 
# $ C and $ D are LONG coefficient vectors !
# 
# Created on : Tue Nov 16 13:16:07 GMT 1999 
# Type of decomposition:  wavelet 
# 
# summary:
# ----------
# Length of original:  32 
# Levels:  4 
# Filter was:  Geronimo Multiwavelets 
# Scaling fns:  2 
# Wavelet fns:  2 
# Prefilter:  default 
# Scaling factor:  2 
# Boundary handling:  periodic 
# Transform type:  wavelet 
# Date:  Tue Nov 16 13:16:07 GMT 1999 



