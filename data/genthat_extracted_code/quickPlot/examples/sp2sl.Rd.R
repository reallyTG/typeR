library(quickPlot)


### Name: sp2sl
### Title: Convert pairs of coordinates to SpatialLines
### Aliases: sp2sl

### ** Examples

caribou <- sp::SpatialPoints(coords = cbind(x = stats::runif(1e1, -50, 50),
                                        y = stats::runif(1e1, -50, 50)))
caribouFrom <- sp::SpatialPoints(coords = cbind(x = stats::runif(1e1, -50, 50),
                                        y = stats::runif(1e1, -50, 50)))
caribouLines <- sp2sl(caribou, caribouFrom)
Plot(caribouLines, length = 0.1)



