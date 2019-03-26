library(bspec)


### Name: empiricalSpectrum
### Title: Compute the "empirical" spectrum of a time series.
### Aliases: empiricalSpectrum
### Keywords: ts

### ** Examples

# load example data:
data(lh)

# compute spectrum:
spec1 <- empiricalSpectrum(lh)
plot(spec1$frequency, spec1$power, log="y", type="b")

# plot "spectrum()" function's result in comparison:
spec2 <- spectrum(lh, plot=FALSE)
lines(spec2$freq, spec2$spec, col="red")

# make both spectra match:
spec3 <- empiricalSpectrum(lh, two.sided=TRUE)
spec4 <- spectrum(lh, plot=FALSE, taper=0, fast=FALSE, detrend=FALSE)
plot(spec3$frequency, spec3$power, log="y", type="b")
lines(spec4$freq, spec4$spec, col="green")



