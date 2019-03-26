library(wavethresh)


### Name: putD.wd
### Title: Puts a whole resolution level of mother wavelet coeffients into
###   wd wavelet object.
### Aliases: putD.wd
### Keywords: manip

### ** Examples

#
# Generate an EMPTY wd object:
#
zero <- rep(0, 16)
zerowd <- wd(zero)
#
# Put some random father wavelet coefficients into the object at
# resolution level 2. For the decimated wavelet transform there
# are always 2^i coefficients at resolution level i. So we have to
# insert 4 coefficients
#
mod.zerowd <- putD( zerowd, level=2, v=rnorm(4))
#
# If you plot mod.zerowd you will see that there are only 
# coefficients at resolution level 2 where you just put the coefficients.
#
# Now, for a time-ordered non-decimated wavelet transform object the
# procedure is exactly the same EXCEPT that there are going to be
# 16 coefficients at each resolution level. I.e.
#
# Create empty TIME-ORDERED NON-DECIMATED wavelet transform object
#
zerowdS <- wd(zero, type="station")
#
# Now insert 16 random coefficients at resolution level 2
#
mod.zerowdS <- putD(zerowdS, level=2, v=rnorm(16))
#
# Once more if you plot mod.zerowdS then there will only be
# coefficients at resolution level 2.



