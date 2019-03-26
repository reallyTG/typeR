library(wavethresh)


### Name: numtonv
### Title: Convert an index number into a node vector object.
### Aliases: numtonv
### Keywords: algebra

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
#
# Make it noisy
#
ynoise <- test.data + rnorm(512, sd=0.1)
#
# Do packet ordered non-decimated wavelet transform
#
ynwst <- wst(ynoise)
#
# Now threshold the coefficients
#
ynwstT <- threshold(ynwst)
#
# Select basis number 9 (why not?)
#
NodeVector9 <- numtonv(9, nlevelsWT(ynwstT))
#
# Let's print it out to see what it looks like
# (nb, if you're repeating this examples, the basis might be different
# as you may have generated different pseudo random noise to me)
#
NodeVector9
# Level :  8  Action is  R (getpacket Index:  1 )
# Level :  7  Action is  L (getpacket Index:  2 )
# Level :  6  Action is  L (getpacket Index:  4 )
# Level :  5  Action is  R (getpacket Index:  9 )
# Level :  4  Action is  L (getpacket Index:  18 )
# Level :  3  Action is  L (getpacket Index:  36 )
# Level :  2  Action is  L (getpacket Index:  72 )
# Level :  1  Action is  L (getpacket Index:  144 )
# Level :  0  Action is  L (getpacket Index:  288 )
# There are  9  reconstruction steps
#
# The print-out describes the tree through ynwstT that corresponds to
# basis 9.
#
# The NodeVector9 and ynwstT objects could now be supplied to
# InvBasis.wst for inverting ynwstT according
# to the NodeVector9 or basis number 9.



