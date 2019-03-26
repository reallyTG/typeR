library(Rwave)


### Name: cwtTh
### Title: Cauchy's wavelet transform
### Aliases: cwtTh
### Keywords: ts

### ** Examples

    x <- 1:512
    chirp <- sin(2*pi * (x + 0.002 * (x-256)^2 ) / 16)
    retChirp <- cwtTh(chirp, noctave=5, nvoice=12, moments=20)



