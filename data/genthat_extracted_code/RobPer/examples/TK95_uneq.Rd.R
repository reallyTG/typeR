library(RobPer)


### Name: TK95_uneq
### Title: Power law noise generator for unequally sampled observation
###   times
### Aliases: TK95_uneq

### ** Examples

# Compare with example in TK95 to see that the power law is much more clear in
# equally sampled data!
set.seed(31)
# Generate power law noise with exponent alpha=1.5:
tt <- sampler(ttype="unif", ps=1, ncycles=2000, npoints=2000)
y <- TK95_uneq(tt, alpha=1.5)

# Show time series:
plot(tt,y, type="l", main="Irregular Power Law Noise", xlab="t", ylab="y")

# Plot Lomb-Scargle periodogram with log-axes:
temp <- RobPer(cbind(tt,y,1), weighting=FALSE, model="sine", regression="L2",
    periods=2000/seq(2, 1000, 2))
plot(log(seq(2, 1000, 2)/2000), log(temp), main="log-log-Fourier periodogram",
    xlab="log(frequency)", ylab="log(periodogram)")
title(main= "Power Law not so obvious", cex.main=0.8, line=0.5)

# A line with slope -alpha for comparison
abline(a=-10, b=-1.5, col="red")
text(-5, -1.5, expression(alpha==1.5), col="red")



