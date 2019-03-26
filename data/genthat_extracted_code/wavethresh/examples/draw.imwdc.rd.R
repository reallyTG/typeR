library(wavethresh)


### Name: draw.imwdc
### Title: Draw mother wavelet associated with an imwdc object.
### Aliases: draw.imwdc
### Keywords: hplot

### ** Examples

#
# Let's use the lennon test image
#
data(lennon)
## Not run: image(lennon)
#
# Now let's do the 2D discrete wavelet transform using Daubechies'
# least-asymmetric wavelet N=6
#
lwd <- imwd(lennon, filter.number=6)
#
# Now let's threshold the 2D DWT
# The resultant class of object is imwdc object.
#
lwdT <- threshold(lwd)
#
# And now draw the wavelet that did this transform
#
## Not run: draw(lwdT)
#
# A nice little two-dimensional wavelet!
#



