library(wavethresh)


### Name: getpacket.wst
### Title: Get packet of coefficients from a packet ordered non-decimated
###   wavelet object (wst).
### Aliases: getpacket.wst
### Keywords: manip

### ** Examples

#
# Take the packet-ordered non-decimated transform of some random data 
#
MyWST <- wst(rnorm(1:512))
#
# The above data set was 2^9 in length. Therefore there are
# coefficients at resolution levels 0, 1, 2, ..., and 8.
#
# The high resolution coefficients are at level 8.
# There should be 256 coefficients at level 8 in index location 0 and 1.
#
length(getpacket(MyWST, level=8, index=0))
#[1] 256
length(getpacket(MyWST, level=8, index=1))
#[1] 256
#
# There are also 256 FATHER wavelet coefficients at each of these two indices
# (origins)
#
length(getpacket(MyWST, level=8, index=0, type="C"))
#[1] 256
length(getpacket(MyWST, level=8, index=1, type="C"))
#[1] 256
#
# There should be 4 coefficients at resolution level 2
#
getpacket(MyWST, level=2, index=0)
#[1] -0.92103095  0.70125471  0.07361174 -0.43467375
#
# Here are the equivalent father wavelet coefficients
#
getpacket(MyWST, level=2, index=0, type="C")
#[1] -1.8233506 -0.2550734  1.9613138  1.2391913



