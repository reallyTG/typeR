library(lmom)


### Name: lmrdpoints
### Title: Add points or lines to an L-moment ratio diagram
### Aliases: lmrdpoints lmrdlines
### Keywords: hplot

### ** Examples

# Plot L-moment ratio diagram of Wind from the airquality data set
data(airquality)
lmrd(samlmu(airquality$Wind), xlim=c(-0.2, 0.2))
# Sample L-moments of each month's data
( lmom.monthly <- with(airquality,
  t(sapply(5:9, function(mo) samlmu(Wind[Month==mo])))) )
# Add the monthly values to the plot
lmrdpoints(lmom.monthly, pch=19, col="blue")


# Draw an L-moment ratio diagram and add a line for the
# Weibull distribution
lmrd(xaxs="i", yaxs="i", las=1)
weimom <- sapply( seq(0, 0.9, by=0.01),
  function(tau3) lmrwei(pelwei(c(0,1,tau3)), nmom=4) )
lmrdlines(t(weimom), col='darkgreen', lwd=2)




