library(wavethresh)


### Name: putpacket.wst
### Title: Put a packet of coefficients into a packet ordered non-decimated
###   wavelet object (wst).
### Aliases: putpacket.wst
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
# [1] 256
length(getpacket(MyWST, level=8, index=1))
# [1] 256
#
# There should be 4 coefficients at resolution level 2
#
getpacket(MyWST, level=2, index=0)
# [1] -0.92103095  0.70125471  0.07361174 -0.43467375
#
# O.k. Let's insert the packet containing the numbers 19,42,21,32
#
NewMyWST <- putpacket(MyWST, level=2, index=0, packet=c(19,42,31,32))
#
# Let's check that it put the numbers in correctly by reaccessing that
# packet...
#
getpacket(NewMyWST, level=2, index=0)
# [1] 19 42 31 32
#
# Yep. It inserted the packet correctly.



