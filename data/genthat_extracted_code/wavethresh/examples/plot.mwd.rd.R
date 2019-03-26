library(wavethresh)


### Name: plot.mwd
### Title: Use plot on an mwd object.
### Aliases: plot.mwd
### Keywords: hplot

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
## Not run: ts.plot(test.data)
#
# Decompose test.data with multiple wavelet transform and
# plot the wavelet coefficients
#
tdmwd <- mwd(test.data)
## Not run: plot(tdmwd)
#[1] 1.851894 1.851894 1.851894 1.851894 1.851894 1.851894 1.851894
#
# You should see a plot with wavelet coefficients like in
# plot.wd but at each coefficient position
# there are two coefficients in two different colours one for each of
# the wavelets at that position.
#
# Note the scale for each level is returned by the function. 



