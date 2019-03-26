library(quantspec)


### Name: increasePrecision-QuantileSD
### Title: Increase the precision of a 'QuantileSD'
### Aliases: increasePrecision,QuantileSD-method
###   increasePrecision-QuantileSD

### ** Examples

# First simulate a copula spectral density from R=20 independent runs.
csd <- quantileSD(N=2^9, ts=ts1, levels.1=c(0.25,0.5), type="copula", R=20)

# Check out the result:
getR(csd)
plot(csd)

# Now increase the number of independent simulation runs to 50.
csd <- increasePrecision(csd, R=30)

# Check out the (more precise) result:
getR(csd)
plot(csd)



