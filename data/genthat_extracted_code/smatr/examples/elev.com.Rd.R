library(smatr)


### Name: elev.com
### Title: Test for equal elevation among several lines fitted with
###   (standardised) major axes of common slope.
### Aliases: elev.com
### Keywords: htest

### ** Examples

# Load leaf longevity data
data(leaflife)

# Test for common SMA slope amongst species at low soil nutrient sites
# with different rainfall:
leaf.low.soilp <- subset(leaflife, soilp == 'low')
with(leaf.low.soilp, slope.com(log10(longev), log10(lma), rain))

# Now test for common elevation of the groups fitted with an axis
# of common slope, at low soil nutrient sites:
with(leaf.low.soilp, elev.com(log10(longev), log10(lma), rain))

# Or test for common elevation amongst the MA's of common slope,
# for low soil nutrient sites, and construct 99% a confidence interval
# for the common elevation:
with(leaf.low.soilp, elev.com(log10(longev), log10(lma), rain, method='MA',
   alpha=0.01))



