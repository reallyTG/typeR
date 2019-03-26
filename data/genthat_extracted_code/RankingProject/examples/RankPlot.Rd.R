library(RankingProject)


### Name: RankPlot
### Title: Figure containing a plot of ranking data.
### Aliases: RankPlot

### ** Examples

# Plot of 90% confidence intervals for differences
# between each state and Colorado, with demi-Bonferroni correction,
# for US states' mean travel times to work, from the 2011 ACS
data(TravelTime2011)
with(TravelTime2011,
     RankPlot(est = Estimate.2dec, se = SE.2dec,
              names = Abbreviation, refName = "CO",
              confLevel = 0.90, cex = 0.6,
              plotType = "difference"))



