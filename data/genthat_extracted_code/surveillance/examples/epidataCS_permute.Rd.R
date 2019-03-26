library(surveillance)


### Name: epidataCS_permute
### Title: Randomly Permute Time Points or Locations of '"epidataCS"'
### Aliases: permute.epidataCS
### Keywords: manip

### ** Examples

data("imdepi")

set.seed(3)
permepi <- permute.epidataCS(imdepi, what = "time", keep = time <= 30)

print(imdepi, n = 8)
print(permepi, n = 8)
## the first 6 events are kept (as are all row.names),
## the time labels of the remaining events are shuffled
## (and events then again sorted by time),
## the marginal temporal distribution is unchanged



