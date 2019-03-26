library(Rwave)


### Name: cwt
### Title: Continuous Wavelet Transform
### Aliases: cwt
### Keywords: ts

### ** Examples

    x <- 1:512
    chirp <- sin(2*pi * (x + 0.002 * (x-256)^2 ) / 16)
    retChirp <- cwt(chirp, noctave=5, nvoice=12)



