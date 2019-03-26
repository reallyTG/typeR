library(emuR)


### Name: fapply
### Title: Function that applies a function to an EMU spectral object
### Aliases: fapply
### Keywords: utilities

### ** Examples


# mean value per spectrum, input is a spectral matrix
m <- fapply(vowlax.dft.5, sapply, FUN=mean)
# as above but after converting dB to powers before
# applying the function
m <- fapply(vowlax.dft.5, sapply, FUN=mean, power=TRUE)
# spectral range
r <- fapply(vowlax.dft.5, range)
# spectral moments applied to a trackdata object
# m is a four-dimensional trackdata object
m <- fapply(fric.dft, moments)
# 1st 3 DCT coefficients calculated in a spectral matrix
# d is a 3-columned matrix
d <- fapply(vowlax.dft.5, dct, 3)
# dct-smooth with 10 coefficients. d2 is spectral matrix
d2 <- fapply(vowlax.dft.5, dct, 10, TRUE)
# dct-smooth a trackdata object with 10 coefficients
d3 <- fapply(fric.dft[1:4,], dct, 10, TRUE)





