library(lmomRFA)


### Name: regquant
### Title: Quantiles and quantile function of a regional frequency
###   distribution
### Aliases: regqfunc regquant
### Keywords: misc

### ** Examples

rfit <- regfit(Cascades,"gno")  # Fit regional distribution

# Compute some quantiles
regquant(seq(0.1, 0.9, by=0.1), regfit(Cascades,"gno"))

# Get the quantile function (regional growth curve)
rgc <- regqfunc(rfit)

# Compute quantiles by evaluating the regional growth curve
rgc(seq(0.1, 0.9, by=0.1))

# Plot the regional growth curve
curve(rgc, 0.01, 0.99)




