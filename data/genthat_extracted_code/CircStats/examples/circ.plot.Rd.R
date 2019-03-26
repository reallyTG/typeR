library(CircStats)


### Name: circ.plot
### Title: Circular Data Plot
### Aliases: circ.plot
### Keywords: hplot

### ** Examples

# Generate 100 observations from a von Mises distribution.
# with mean direction 0 and concentration 3.
data.vm <- rvm(100, 0, 3) 
# Plot data set. All points do not fit on plot.
circ.plot(data.vm, stack=TRUE, bins=150) 
# Shrink the plot so that all points fit.
circ.plot(data.vm, stack=TRUE, bins=150, shrink=1.5) 



