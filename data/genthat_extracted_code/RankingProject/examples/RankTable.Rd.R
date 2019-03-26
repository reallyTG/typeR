library(RankingProject)


### Name: RankTable
### Title: Figure containing a table of ranking data.
### Aliases: RankTable

### ** Examples

# Table of US states' mean travel times to work, from the 2011 ACS
data(TravelTime2011)
# Just as inside RankPlotWithTable(),
# we have to set par(xpd=TRUE)
# and adjust the plotting margins
oldpar <- par(no.readonly = TRUE)
oldmar <- par('mar')
par(xpd=TRUE, mar=c(oldmar[1],0,oldmar[3],0))
with(TravelTime2011,
     RankTable(ranks = Rank, names = State,
               est = Estimate.2dec, se = SE.2dec,
               placeType = "State"))
par(oldpar)



