library(agridat)


### Name: cochran.beets
### Title: Yield and number of plants in a sugarbeet fertilizer experiment
### Aliases: cochran.beets
### Keywords: datasets

### ** Examples

data(cochran.beets)
dat = cochran.beets

# P has strong effect
require(lattice)
xyplot(yield ~ plants|fert, dat, main="cochran.beets") 




