library(TSclust)


### Name: diss.DWT
### Title: Dissimilarity for Time Series Based on Wavelet Feature
###   Extraction
### Aliases: diss.DWT
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- cumsum(rnorm(100))
y <- cumsum(rnorm(100))
z <- sin(seq(0, pi, length.out=100))

#compute the distance
diss.DWT(rbind(x, y, z))



