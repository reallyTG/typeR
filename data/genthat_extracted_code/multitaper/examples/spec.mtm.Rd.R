library(multitaper)


### Name: spec.mtm
### Title: Compute and plot multitaper spectrum estimates
### Aliases: spec.mtm
### Keywords: multitaper

### ** Examples

## default behaviour, dpss tapers; deltat and dtUnits set to ensure axis accuracy
data(willamette)
spec.mtm(willamette, nw=4.0, k=8, deltat=1/12, dtUnits="year")
spec.mtm(willamette, nw=4.0, k=8, nFFT=2048, deltat=1/12, dtUnits="year")

## if you have a ts object, you can skip the deltat and dtUnits parameters
will.ts <- ts(data=willamette, start=1950.75, freq=12)
spec.mtm(will.ts, nw=4.0, k=8)

## using Sine Tapers
spec.mtm(will.ts, k=10, taper="sine", sineAdaptive=FALSE)
spec.mtm(will.ts, k=10, taper="sine", sineAdaptive=TRUE, 
         maxAdaptiveIterations=100, sineSmoothFact=0.05)



