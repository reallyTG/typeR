library(diveMove)


### Name: calibrateDepth
### Title: Calibrate Depth and Generate a "TDRcalibrate" object
### Aliases: calibrateDepth
### Keywords: manip math

### ** Examples


data(divesTDR)
divesTDR

## No test: 
## Too long for checks
## Consider a 3 m offset, a dive threshold of 3 m, the 1% quantile for
## critical vertical rates, and a set of knots 20 times as long as the
## observed time steps. Default smoothing spline model for dive phase
## detection, using default smoothing parameter.
(dcalib <- calibrateDepth(divesTDR, dive.thr=3, zoc.method="offset",
                          offset=3, descent.crit.q=0.01, ascent.crit.q=0,
                          knot.factor=20))
## Or ZOC algorithmically with method="filter":
## filter in this dataset
(dcalib <- calibrateDepth(divesTDR, dive.thr=3, zoc.method="filter",
                          k=c(3, 5760), probs=c(0.5, 0.02), na.rm=TRUE,
                          descent.crit.q=0.01, ascent.crit.q=0,
                          knot.factor=20))
## End(No test)




