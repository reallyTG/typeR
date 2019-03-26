library(wavethresh)


### Name: draw.wst
### Title: Draw mother wavelet or scaling function associated with wst
###   object.
### Aliases: draw.wst
### Keywords: hplot

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
## Not run: ts.plot(test.data)
#
# Now do the \code{packet-ordered non-decimated DWT}  of the data using the Daubechies
# least-asymmetric wavelet N=10 (the default arguments in \code{wst}).
#
tdwst <- wst(test.data)
#
# What happens if we try to draw this new tdwst object?
#
## Not run: draw(tdwst)
#
# We get a picture of the wavelet that did the transform
#



