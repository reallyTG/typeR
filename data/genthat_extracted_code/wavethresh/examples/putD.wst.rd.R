library(wavethresh)


### Name: putD.wst
### Title: Puts a whole resolution level of mother wavelet coeffients into
###   wst wavelet object.
### Aliases: putD.wst
### Keywords: manip

### ** Examples

#
# Generate an EMPTY wst object:
#
zero <- rep(0, 16)
zerowst <- wst(zero)
#
# Put some random mother wavelet coefficients into the object at
# resolution level 2. For the non-decimated wavelet transform there
# are always 16 coefficients at every resolution level. 
#
mod.zerowst <- putD( zerowst, level=2, v=rnorm(16))
#
# If you plot mod.zerowst you will see that there are only 
# coefficients at resolution level 2 where you just put the coefficients.



