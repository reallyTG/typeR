library(cheddar)


### Name: PlotRankNPS
### Title: Plot rank of node properties
### Aliases: PlotRankNPS PlotBvRankB PlotMvRankM PlotNvRankN
### Keywords: hplot

### ** Examples

data(TL84)
PlotNvRankN(TL84)

# log10(N) against log10(rank of M)
PlotRankNPS(TL84, property='Log10N', rank.by='M', log10.rank=TRUE)


# The 'POM (detritus)' node in the Ythan Estuary dataset lacks body mass.
par(mfrow=c(1,2))
data(YthanEstuary)
PlotMvRankM(YthanEstuary)
PlotMvRankM(YthanEstuary, show.na=TRUE)



