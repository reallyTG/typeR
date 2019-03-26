library(wavethresh)


### Name: putD.wp
### Title: Puts a whole resolution level of wavelet packet coeffients into
###   wp wavelet object.
### Aliases: putD.wp
### Keywords: manip

### ** Examples

#
# Generate an EMPTY wp object:
#
zero <- rep(0, 16)
zerowp <- wp(zero)
#
# Put some random mother wavelet coefficients into the object at
# resolution level 2. For the wavelet packet transform there
# are always 16 coefficients at every resolution level. 
#
mod.zerowp <- putD( zerowp, level=2, v=rnorm(16))
#
# If you plot mod.zerowp you will see that there are only 
# coefficients at resolution level 2 where you just put the coefficients.



