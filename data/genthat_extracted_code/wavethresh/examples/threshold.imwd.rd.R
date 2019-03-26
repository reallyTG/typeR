library(wavethresh)


### Name: threshold.imwd
### Title: Threshold two-dimensional wavelet decomposition object
### Aliases: threshold.imwd
### Keywords: nonlinear smooth

### ** Examples

#
# Let's use the lennon test image
#
data(lennon)
## Not run: image(lennon)
#
# Now let's do the 2D discrete wavelet transform
#
lwd <- imwd(lennon)
#
# Let's look at the coefficients
#
## Not run: plot(lwd)
#
# Now let's threshold the coefficients
#
lwdT <- threshold(lwd)
#
# And let's plot those the thresholded coefficients
#
## Not run: plot(lwdT)
#
# Note that the only remaining coefficients are down in the bottom
# left hand corner of the plot. All the others (black) have been set
# to zero (i.e. thresholded).



