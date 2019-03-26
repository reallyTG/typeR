library(wavethresh)


### Name: imwd
### Title: Two-dimensional wavelet transform (decomposition).
### Aliases: imwd
### Keywords: smooth

### ** Examples

data(lennon)
#
# Let's use the lennon test image
#
## Not run: image(lennon)
#
# Now let's do the 2D discrete wavelet transform
#
lwd <- imwd(lennon)
#
# Let's look at the coefficients
#
## Not run: plot(lwd)



