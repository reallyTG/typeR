library(smatr)


### Name: plot.sma
### Title: Draw an X-Y plot
### Aliases: plot.sma
### Keywords: misc

### ** Examples

# Load leaf lifetime dataset:
data(leaflife)

# Only consider low-nutrient sites:
leaf.low.soilp <- subset(leaflife, soilp == 'low')

# Fit SMA's separately at each of high and low 
# rainfall sites and test for common slope:
ft <- sma(longev~lma*rain, data=leaf.low.soilp, log="xy")

# Plot leaf longevity (longev) vs leaf mass per area (lma) 
# separately for each of high and low rainfall:
plot(ft)

# As before but add lines which have a common slope:
plot(ft, use.null=TRUE)

#As above, but adding the common slope lines to an existing plot
plot(ft, type='p', col="black")
plot(ft, use.null=TRUE, add=TRUE, type='l')

# Plot with equally spaced tick marks:
plot(ft, xaxis=defineAxis(major.ticks=c(40,80,160,320,640)), 
	yaxis=defineAxis(major.ticks=c(0.5,1,2,4,8)) )

# Produce a residual plot to check assumptions:
plot(ft,which="res")

# Produce a normal quantile plot:
plot(ft,which="qq")




