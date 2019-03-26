library(lmom)


### Name: lmrd
### Title: L-moment ratio diagram
### Aliases: lmrd
### Keywords: hplot

### ** Examples

data(airquality)
lmrd(samlmu(airquality$Ozone))

# Tweaking a few graphics parameters makes the graph look better
# (in the author's opinion)
lmrd(samlmu(airquality$Ozone), xaxs="i", yaxs="i", las=1)

# An example that illustrates the sampling variability of L-moments
#
# Generate 50 random samples of size 30 from the Gumbel distribution
# - stored in the rows of matrix mm
mm <- matrix(quagum(runif(1500)), nrow=50)
#
# Compute the first four sample L-moments of each sample
# - stored in the rows of matrix aa
aa <- apply(mm, 1, samlmu)
#
# Plot the L-skewness and L-kurtosis values on an L-moment ratio
# diagram that also shows (only) the population L-moment ratios
# of the Gumbel distribution
lmrd(t(aa), dist="", twopar="G", col="red")

# L-moment ratio diagram with curves for GLO, GEV, GPA, and Weibull.
# The Weibull curve is added manually. A legend is added,
# using information returned from lmrd().
#
# - Draw the diagram, with the GLO, GEV, and GPA curves
info <- lmrd(distributions="GLO GEV GPA", xaxs="i", yaxs="i", las=1, legend=FALSE)
#
# - Compute L-skewness and L-kurtosis values for Weibull
sa <- sapply(seq(0, 0.6, by=0.01),
    function(tau3) lmrwei(pelwei(c(0,1,tau3)), nmom=4)[3:4])
#
# - Plot the Weibull curve
lmrdlines(sa["tau_3",], sa["tau_4",], col="magenta", lwd=2)
#
# - Add a legend
legend("topleft", bty="n",
  legend = c(info$lines$distributions, "WEI"),
  col = c(info$lines$col.lines, "magenta"),
  lwd = c(info$lines$lwd, 3))



