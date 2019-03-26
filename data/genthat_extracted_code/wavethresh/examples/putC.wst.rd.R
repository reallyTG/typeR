library(wavethresh)


### Name: putC.wst
### Title: Puts a whole resolution level of father wavelet coeffients into
###   wst wavelet object.
### Aliases: putC.wst
### Keywords: manip

### ** Examples

#
# Generate an EMPTY wst object:
#
zero <- rep(0, 16)
zerowst <- wst(zero)
#
# Put some random father wavelet coefficients into the object at
# resolution level 2. For the non-decimated wavelet transform there
# are always 16 coefficients at every resolution level. 
#
mod.zerowst <- putC( zerowst, level=2, v=rnorm(16))
#
# If you use accessC  on mod.zerowd you would see that there were only
# coefficients at resolution level 2 where you just put the coefficients.



