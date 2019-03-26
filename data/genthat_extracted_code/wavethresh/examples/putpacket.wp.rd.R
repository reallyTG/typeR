library(wavethresh)


### Name: putpacket.wp
### Title: Inserts a packet of coefficients into a wavelet packet object
###   (wp).
### Aliases: putpacket.wp
### Keywords: manip

### ** Examples

#
# Take the wavelet packet transform of some random data
#
MyWP <- wp(rnorm(1:512))
#
# The above data set was 2^9 in length. Therefore there are
# coefficients at resolution levels 0, 1, 2, ..., and 8.
#
# The high resolution coefficients are at level 8.
# There should be 256 DG coefficients and 256 DH coefficients
#
length(getpacket(MyWP, level=8, index=0))
# [1] 256
length(getpacket(MyWP, level=8, index=1))
# [1] 256
#
# The next command shows that there are only two packets at level 8
#
#getpacket(MyWP, level=8, index=2)
# Index was too high, maximum for this level is  1 
# Error in getpacket.wp(MyWP, level = 8, index = 2): Error occured
# Dumped
#
# There should be 4 coefficients at resolution level 2
#
# The father wavelet coefficients are (index=0)
getpacket(MyWP, level=2, index=0)
# [1] -0.9736576  0.5579501  0.3100629 -0.3834068
#
# The mother wavelet coefficients are (index=1)
#
getpacket(MyWP, level=2, index=1)
# [1]  0.72871405  0.04356728 -0.43175307  1.77291483
#
# Well, that exercised the getpacket.wp
# function. Now that we know that level 2 coefficients have 4 coefficients
# let's insert some into the MyWP object.
#
MyWP <- putpacket(MyWP, level=2, index=0, packet=c(21,32,67,89))
#
# O.k. that was painless. Now let's check that the correct coefficients
# were inserted.
#
getpacket(MyWP, level=2, index=0)
#[1] 21 32 67 89
#
# Yep. The correct coefficients were inserted.



