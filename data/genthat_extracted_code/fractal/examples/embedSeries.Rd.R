library(fractal)


### Name: embedSeries
### Title: Creates a delay embedding of a single variable time series
### Aliases: embedSeries print.embedSeries eda.plot.embedSeries
###   [.embedSeries plot.embedSeries as.matrix.embedSeries
### Keywords: univar models nonlinear

### ** Examples

## embed the beamchaos series in 10 dimensions 
## using a time lag of 15. 
z <- embedSeries(beamchaos, tlag=15, dim=10)

## plot the attractor in the phase space 
## Not run: plot(z)

## plot the embedding projected down to two 
## dimensions 
plot(z, dim=2)



