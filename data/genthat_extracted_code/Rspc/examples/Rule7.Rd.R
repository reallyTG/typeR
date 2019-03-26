library(Rspc)


### Name: Rule7
### Title: Rule 7
### Aliases: Rule7

### ** Examples

limits = CalculateLimits(x = rnorm(10), lcl = NA, cl = 100, ucl = NA, type = 'i')
zones = CalculateZoneBorders(limits)
Rule7(x = rnorm(20), zoneB = zones, nPoints = 15)
#zones is object created by function CalculateZoneBorders()



