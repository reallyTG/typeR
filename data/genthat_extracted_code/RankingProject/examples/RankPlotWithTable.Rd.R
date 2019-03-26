library(RankingProject)


### Name: RankPlotWithTable
### Title: Figure containing aligned table and plot of ranking data.
### Aliases: RankPlotWithTable

### ** Examples

# Table with plot of individual 90% confidence intervals
# for US states' mean travel times to work, from the 2011 ACS
data(TravelTime2011)
tableParList <- with(TravelTime2011,
  list(ranks = Rank, names = State,
       est = Estimate.2dec, se = SE.2dec,
       placeType = "State"))
plotParList <- with(TravelTime2011,
  list(est = Estimate.2dec, se = SE.2dec,
       names = Abbreviation,
       confLevel = .90, plotType = "individual", cex = 0.6))
RankPlotWithTable(tableParList = tableParList,
  plotParList = plotParList)

# Illustrating the use of annotRefName and annotRefRank:
# Table with plot of 90% confidence intervals for differences
# between each state and Colorado, with demi-Bonferroni correction
plotParList$plotType <- "difference"
plotParList$refName <- "CO"
RankPlotWithTable(tableParList = tableParList,
  plotParList = plotParList, annotRefName = "Colorado",
  annotRefRank = TravelTime2011$Rank[which(TravelTime2011$Abbreviation == "CO")])



