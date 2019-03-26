library(pointRes)


### Name: pointer.rgc
### Title: Calculate pointer years using the relative growth change method
### Aliases: pointer.rgc

### ** Examples

## Calculate pointer years on tree-ring series
data(s033)
py <- pointer.rgc(s033, nb.yrs = 4, rgc.thresh.pos = 60, rgc.thresh.neg = 40, 
                  series.thresh = 75)
py$out




