library(LS2W)


### Name: imwd
### Title: Two-dimensional wavelet transform (decomposition).
### Aliases: imwd
### Keywords: models

### ** Examples

#
#First let's create an image
#
tmp <- HaarMontage(direction="diagonal")
#
# Now let's do the 2D discrete wavelet transform on the image.
#
lwd <- imwd(tmp)
#
# Let's look at the coefficients
#
plot(lwd)



