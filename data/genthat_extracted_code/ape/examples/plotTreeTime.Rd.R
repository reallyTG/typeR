library(ape)


### Name: plotTreeTime
### Title: Plot Tree With Time Axis
### Aliases: plotTreeTime
### Keywords: hplot

### ** Examples

dates <- as.Date(.leap.seconds)
tr <- rtree(length(dates))
plotTreeTime(tr, dates)

## handling NA's:
dates[11:26] <- NA
plotTreeTime(tr, dates)

## dates can be on an arbitrary scale, e.g., [-1, 1]:
plotTreeTime(tr, runif(Ntip(tr), -1, 1))



