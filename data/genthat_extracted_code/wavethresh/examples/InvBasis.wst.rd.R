library(wavethresh)


### Name: InvBasis.wst
### Title: Invert a wst library representation with a basis specification
### Aliases: InvBasis.wst
### Keywords: smooth

### ** Examples

#
# Let's generate a noisy signal
#
x <- example.1()$y + rnorm(512, sd=0.2)
#
# You can plot this if you like
#
## Not run: ts.plot(x)
#
# Now take the nondecimated wavelet transform
#
xwst <- wst(x)
#
# Threshold it
#
xwstT <- threshold(xwst)
#
# You can plot this too if you like
#
## Not run: plot(xwstT)
#
# Now use Coifman-Wickerhauser to get a "good" basis
#
xwstTNV <- MaNoVe(xwstT)
#
# Now invert the thresholded wst using this basis specification
#
xTwr <- InvBasis(xwstT, xwstTNV)
#
# And plot the result, and superimpose the truth in dotted
#
## Not run: ts.plot(xTwr)
## Not run: lines(example.1()$y, lty=2)



