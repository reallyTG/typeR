library(wmtsa)


### Name: wavCWT
### Title: Continuous wavelet transform
### Aliases: wavCWT as.matrix.wavCWT plot.wavCWT print.wavCWT
### Keywords: univar

### ** Examples

## calculate the CWT of the sunspots series using 
## a Mexican hat wavelet (gaussian2) 
sunspots.cwt <- wavCWT(sunspots)

## print the result 
print(sunspots.cwt)

## plot an image of the modulus of the CWT and the 
## time series 
plot(sunspots.cwt, series=TRUE)

## plot a coarse-scale wire-frame perspective of 
## the CWT 
plot(sunspots.cwt, type="persp")



