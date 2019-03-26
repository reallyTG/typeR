library(wavethresh)


### Name: draw.wp
### Title: Draw wavelet packet associated with a wp object.
### Aliases: draw.wp
### Keywords: hplot

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
## Not run: ts.plot(test.data)
#
# Now do the wavelet packet transform of the data using the Daubechies
# least-asymmetric wavelet N=10 (the default arguments in
# wp).
#
tdwp <- wp(test.data)
#
# What happens if we try to draw this new tdwp object?
#
## Not run: draw(tdwd, level=4, index=12)



