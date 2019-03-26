library(lfstat)


### Name: baseflow
### Title: Calculate the baseflow of a river
### Aliases: baseflow
### Keywords: low-flow

### ** Examples

## reproducing Tallaksen and van Lanen (2004)
## Example 5.3 Base Flow Index"

data(ray)
ray <- as.xts(ray)

# calculate baseflow and plot it
ray$baseflow <- baseflow(ray$discharge)
ray96 <- ray[format(time(ray), "%Y") == "1996", ]
plot(ray96$discharge, type = "l")
lines(ray96$baseflow, col = 2)

# aggregated base flows for river Ray
# these are mean flow totals per day, not per year as written
# in Tallaksen and van Lanen (2004)
round(colSums(ray96[, c("discharge", "baseflow")]), 2)



