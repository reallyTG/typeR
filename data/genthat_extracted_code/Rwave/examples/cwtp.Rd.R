library(Rwave)


### Name: cwtp
### Title: Continuous Wavelet Transform with Phase Derivative
### Aliases: cwtp
### Keywords: ts

### ** Examples

    ## discards imaginary part with error,
    ## c code does not account for Im(input)
    x <- 1:512
    chirp <- sin(2*pi * (x + 0.002 * (x-256)^2 ) / 16)
    chirp <- chirp + 1i * sin(2*pi * (x + 0.004 * (x-256)^2 ) / 16)
    retChirp <- cwtp(chirp, noctave=5, nvoice=12)



