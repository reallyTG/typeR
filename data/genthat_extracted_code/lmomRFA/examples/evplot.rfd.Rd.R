library(lmomRFA)


### Name: evplot.rfd
### Title: Extreme-value plot of a regional frequency distribution
### Aliases: evplot evplot.rfd
### Keywords: hplot

### ** Examples

Cascades                        # An object of class "regdata"
rfit <- regfit(Cascades, "gno") # Fit a generalized normal distribution

evplot(rfit)                    # Plot the regional growth curve

# Compute error bounds for quantile estimates.  We will
# (optimistically) generate bounds for a homogeneous region
# with the same frequency distribution as the one fitted to
# the Cascades data.
fval <- seq(.01, .99, by=.01)   # A lot of quantiles
simq <- regsimq(rfit$qfunc, nrec=Cascades$n, nrep=100, f=fval,
  fit=rfit$dist)

# Regional growth curve, and bounds
rbounds <- regquantbounds(simq, rfit)
evplot(rfit, rbounds)

# Quantile function for site 3, and bounds
sbounds <- sitequantbounds(simq, rfit, site=3)
evplot(rfit, sbounds)



