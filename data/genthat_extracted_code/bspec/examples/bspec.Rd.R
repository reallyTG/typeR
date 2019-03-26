library(bspec)


### Name: bspec
### Title: Computing the spectrum's posterior distribution
### Aliases: bspec bspec.default print.bspec plot.bspec is.bspec
### Keywords: ts

### ** Examples

# determine spectrum's posterior distribution
# (for noninformative prior):
lhspec <- bspec(lh)
print(lhspec)

# show some more details:
str(lhspec)

# plot 95 percent central intervals and medians:
plot(lhspec)

# draw and plot a sample from posterior distribution:
lines(lhspec$freq, sample(lhspec), type="b", pch=20)

########

# compare the default outputs of "bspec()" and "spectrum()":
bspec1    <- bspec(lh)
spectrum1 <- spectrum(lh, plot=FALSE)
plot(bspec1) 
lines(spectrum1$freq, spectrum1$spec, col="blue")
# (note -among others- the factor 2 difference)

# match the outputs:
# Need to suppress  tapering, padding and de-trending
# (see help for "spec.pgram()"):
spectrum2 <- spectrum(lh, taper=0, fast=FALSE, detrend=FALSE, plot=FALSE)
# Need to drop intercept (zero frequency) term:
bspec2    <- bspec(lh, intercept=FALSE)
# plot the "spectrum()" output:
plot(spectrum2)
# draw the "bspec()" scale parameters, adjusted
# by the corresponding degrees-of-freedom,
# so they correspond to one-sided spectrum:
lines(bspec2$freq, bspec2$scale/bspec2$datadf,
      type="b", col="green", lty="dashed")

########

# handle several time series at once...
data(sunspots)
# extract three 70-year segments:
spots1 <- window(sunspots, 1750, 1819.99)
spots2 <- window(sunspots, 1830, 1899.99)
spots3 <- window(sunspots, 1910, 1979.99)
# align their time scales:
tsp(spots3) <- tsp(spots2) <- tsp(spots1)
# combine to multivariate time series:
spots <- ts.union(spots1, spots2, spots3)
# infer spectrum:
plot(bspec(spots))



