library(Rspc)


### Name: Rule6
### Title: Rule 6
### Aliases: Rule6

### ** Examples

limits = CalculateLimits(x = rnorm(10), lcl = NA, cl = 100, ucl = NA, type = 'i')
zones = CalculateZoneBorders(limits)
Rule6(x = rnorm(20), zoneB = zones, minNPoints = 4, nPoints = 5)
#zones is object created by function CalculateZoneBorders()



