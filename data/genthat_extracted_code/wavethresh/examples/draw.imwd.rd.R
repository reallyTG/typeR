library(wavethresh)


### Name: draw.imwd
### Title: Draw mother wavelet associated with an imwd object.
### Aliases: draw.imwd
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
# And now draw the wavelet that did this transform
#
## Not run: draw(lwd)
#
# A nice little two-dimensional wavelet!
#




