library(cheddar)


### Name: PlotNPSDistribution
### Title: Plot distributions of node properties
### Aliases: PlotNPSDistribution PlotBDistribution PlotMDistribution
###   PlotNDistribution PlotDegreeDistribution
### Keywords: hplot

### ** Examples

data(TL84)

PlotMDistribution(TL84)

# A bandwidth of 3
PlotMDistribution(TL84, density.args=list(bw=3))

PlotDegreeDistribution(TL84)



