library(wavethresh)


### Name: draw.wd
### Title: Draw mother wavelet or scaling function associated with wd
###   object.
### Aliases: draw.wd
### Keywords: hplot

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
## Not run: ts.plot(test.data)
#
# Now do the discrete wavelet transform of the data using the Daubechies
# least-asymmetric wavelet N=10 (the default arguments in
# wd).
#
tdwd <- wd(test.data)
#
# What happens if we try to draw this new tdwd object?
#
## Not run: draw(tdwd)
#
# We get a picture of the wavelet that did the transform
#




