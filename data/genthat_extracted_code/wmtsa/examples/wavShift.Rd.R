library(wmtsa)


### Name: wavShift
### Title: Shifts wavelet transform coefficients for approximate zero phase
###   alignment
### Aliases: wavShift
### Keywords: univar

### ** Examples

## plot the zero phase shifted MODWT of a linear 
## chirp sequence 
linchirp <- make.signal("linchirp", n=1024)
plot(wavShift(wavMODWT(linchirp, wavelet="s8",
    n.levels=4, keep.series=TRUE)))



