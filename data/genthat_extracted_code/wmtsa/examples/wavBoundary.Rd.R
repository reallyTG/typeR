library(wmtsa)


### Name: wavBoundary
### Title: Wavelet transform boundary coefficent identification
### Aliases: wavBoundary [.wavBoundary plot.wavBoundary print.wavBoundary
###   print.summary.wavBoundary summary.wavBoundary
### Keywords: univar

### ** Examples

## calculate the MODWT of the sunspots series 
W <- wavMODWT(sunspots)

## identify the boundary coefficients 
z <- wavBoundary(W)

## plot the results 
plot(wavShift(z))

## obtain a summary 
summary(z)



