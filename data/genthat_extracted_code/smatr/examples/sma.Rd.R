library(smatr)


### Name: sma
### Title: (Standardized) major axis estimation and testing for one or
###   several samples
### Aliases: sma ma
### Keywords: misc

### ** Examples


# Load leaf lifetime dataset:
data(leaflife)

### One sample analyses ###
# Extract only low-nutrient, low-rainfall data:
leaf.low <- subset(leaflife, soilp == 'low' & rain == 'low')

# Fit a MA for log(leaf longevity) vs log(leaf mass per area):
ma(longev ~ lma, log='xy', data=leaflife)

# Test if the MA slope is not significantly different from 1:
ma.test <- ma(longev ~ lma, log='xy', slope.test=1, data=leaflife)
summary(ma.test)

# Construct a residual plot to check assumptions:
plot(ma.test,type="residual")

### Several sample analyses ###

# Now consider low-nutrient sites (high and low rainfall):
leaf.low.soilp <- subset(leaflife, soilp == 'low')

# Fit SMA's separately at each of high and low rainfall sites,
# and test for common slope:
com.test <- sma(longev~lma*rain, log="xy", data=leaf.low.soilp)
com.test

# Plot longevity vs LMA separately for each group:
plot(com.test)

# Fit SMA's separately at each of high and low rainfall sites,
# and test if there is a common slope equal to 1:
sma(longev~lma*rain, log="xy", slope.test=1, data=leaf.low.soilp)

# Fit SMA's with common slope across each of high and low rainfall sites, 
# and test for common elevation:
sma(longev~lma+rain, log="xy", data=leaf.low.soilp)

# Fit SMA's with common slope across each of high and low rainfall sites, 
# and test for no shift along common SMA:
sma(longev~lma+rain, log="xy", type="shift", data=leaf.low.soilp)




