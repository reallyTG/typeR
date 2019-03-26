library(SpatialExtremes)


### Name: concurrencemap
### Title: Maps of concurrence probabilities/expected concurrence cell area
### Aliases: concurrencemap
### Keywords: hplot

### ** Examples

require(maps)
data(USHCNTemp)
coord <- as.matrix(metadata[,2:3])

## Subset the station to have a fast example
n.site <- 30
chosen.site <- sample(nrow(coord), n.site)
coord <- coord[chosen.site,]
maxima.summer <- maxima.summer[,chosen.site]

## Define a function to plot the border
border <- function(add = FALSE) maps::map("usa", add = add)

par(mar = rep(0, 4))
## Produce a pairwise concurrence probability map w.r.t. station number 15
concurrencemap(maxima.summer, coord, type = 15, plot.border = border, compute.std.err = TRUE)

## Produce the expected concurrence cell area
concurrencemap(maxima.summer, coord, plot.border = border)



