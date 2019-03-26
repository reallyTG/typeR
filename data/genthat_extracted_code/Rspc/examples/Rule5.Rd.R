library(Rspc)


### Name: Rule5
### Title: Rule 5
### Aliases: Rule5

### ** Examples

limits = CalculateLimits(x = rnorm(10), lcl = NA, cl = 100, ucl = NA, type = 'i')
zones = CalculateZoneBorders(limits)
Rule5(x = rnorm(20), zoneB = zones, minNPoints = 2, nPoints = 3)
#zones is object created by function CalculateZoneBorders()



