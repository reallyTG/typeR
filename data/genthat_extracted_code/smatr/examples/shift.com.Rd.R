library(smatr)


### Name: shift.com
### Title: Test for no mean shift along a common (standardised) major axis
### Aliases: shift.com
### Keywords: htest

### ** Examples

#load leaf longevity data
data(leaflife)

#Test for common SMA slope amongst species at low rainfall sites
#with different levels of soil nutrients
leaf.low.rain=leaflife[leaflife$rain=='low',]
with(leaf.low.rain, slope.com(log10(longev), log10(lma), soilp))

#Now test for no shift along the axes of common slope, for sites
#with different soil nutrient levels but low rainfall:
with(leaf.low.rain, shift.com(log10(longev), log10(lma), soilp))

#Now test for no shift along the axes of common slope, for sites
#with different soil nutrient levels but low rainfall:
with(leaf.low.rain,shift.com(log10(longev), log10(lma), soilp, method='MA'))




