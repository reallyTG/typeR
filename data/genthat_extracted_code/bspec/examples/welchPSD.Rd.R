library(bspec)


### Name: welchPSD
### Title: Power spectral density estimation using Welch's method.
### Aliases: welchPSD
### Keywords: ts

### ** Examples

# load example data:
data(sunspots)
# compute and plot the "plain" spectrum:
spec1 <- empiricalSpectrum(sunspots)
plot(spec1$frequency, spec1$power, log="y", type="l")

# plot Welch spectrum using segments of length 10 years:
spec2 <- welchPSD(sunspots, seglength=10)
lines(spec2$frequency, spec2$power, col="red")

# use 20-year segments and a flatter Tukey window:
spec3 <- welchPSD(sunspots, seglength=20, r=0.2)
lines(spec3$frequency, spec3$power, col="blue")



