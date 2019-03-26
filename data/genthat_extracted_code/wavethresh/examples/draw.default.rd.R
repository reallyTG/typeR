library(wavethresh)


### Name: draw.default
### Title: Draw picture of a wavelet or scaling function.
### Aliases: draw.default
### Keywords: hplot

### ** Examples

#
# First make sure that your favourite graphics device is open
# otherwise S-Plus will complain.
#
# Let's draw a one-dimensional Daubechies least-asymmetric wavelet
# N=10
#
## Not run: draw.default(filter.number=10, family="DaubLeAsymm")
#
# Wow. What a great picture!
#
# Now how about a one-dimensional Daubechies extremal-phase scaling function
# with N=2
#
## Not run: draw.default(filter.number=2, family="DaubExPhase")
#
# Excellent! Now how about a two-dimensional Daubechies least-asymmetric
# N=6 wavelet
#
# N.b. we'll also reduce the resolution down a bit. If we used the default
# resolution of 8192 this would be probably too much for most computers.
#
## Not run: draw.default(filter.number=6, family="DaubLeAsymm", dimension=2, res=256)
#
# What a pretty picture!



