library(multitaper)


### Name: mtm.coh
### Title: Compute and plot the multitaper magnitude-squared coherence.
### Aliases: mtm.coh
### Keywords: multitaper

### ** Examples

data(HadCRUTnh)
data(mlco2)
spec1 <- spec.mtm(HadCRUTnh, nw=5.0, k=8, plot=FALSE,
    returnInternals=TRUE, dtUnits="month", deltat=1.0)
spec2 <- spec.mtm(mlco2, nw=5.0, k=8, plot=FALSE, returnInternals=TRUE,
    dtUnits="month", deltat=1.0)
resCoh <- mtm.coh(spec1, spec2, plot=FALSE)
plot(resCoh)
plot(resCoh, cdfQuantilesTicks=1-10^(-(6:12)))



