library(Rspc)


### Name: Rule8
### Title: Rule 8
### Aliases: Rule8

### ** Examples

limits = CalculateLimits(x = rnorm(10), lcl = NA, cl = 100, ucl = NA, type = 'i')
zones = CalculateZoneBorders(limits)
Rule8(x = rnorm(20), zoneB = zones, nPoints = 8)
#zones is object created by function CalculateZoneBorders()



