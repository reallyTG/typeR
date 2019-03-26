library(WiSEBoot)


### Name: smoothTimeSeries
### Title: Threshold Wavelet Coefficients to Create Smooth Time Series
### Aliases: smoothTimeSeries
### Keywords: smooth ts

### ** Examples

##Visualize data smoothing on the AIRS 60E data
data(CM20N20S60E)
AIRS <- as.vector(CM20N20S60E[ ,1])
padAIRS <- padVector(AIRS)$xPad
smoothAIRS <- smoothTimeSeries(padAIRS, plotLevels="all")



