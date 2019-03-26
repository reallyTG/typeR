library(Rwave)


### Name: cwtimage
### Title: Continuous Wavelet Transform Display
### Aliases: cwtimage
### Keywords: ts

### ** Examples

    x <- 1:512
    chirp <- sin(2*pi * (x + 0.002 * (x-256)^2 ) / 16)
    retChirp <- cwt(chirp, noctave=5, nvoice=12, twoD=FALSE, plot=FALSE)
    retPolar <- cwtpolar(retChirp)
    retImageMod <- cwtimage(retPolar$modulus)
    retImageArg <- cwtimage(retPolar$argument)



