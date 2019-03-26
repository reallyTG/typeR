library(wmtsa)


### Name: reconstruct
### Title: Reconstruction (inverse transform) of various wavelet transforms
### Aliases: reconstruct
### Keywords: methods

### ** Examples

## create a random series, calculate a forward 
## transform, then invert 
x       <- rnorm(1024)
x.dwt   <- reconstruct(wavDWT(x))
x.modwt <- reconstruct(wavMODWT(x))
all(c(splus2R::vecnorm(x.dwt-x), splus2R::vecnorm(x.modwt-x)) < .Machine$single.eps)



