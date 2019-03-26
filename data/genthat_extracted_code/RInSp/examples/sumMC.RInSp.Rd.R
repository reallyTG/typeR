library(RInSp)


### Name: sumMC.RInSp
### Title: Summary function for Monte Carlo resampling results
### Aliases: sumMC.RInSp
### Keywords: function utilities

### ** Examples

#  sumMC.RInSp example using stickleback data from Bolnick and Paull 2009
data(Stickleback)
# Select a single spatial sampling site (site A)
GutContents_SiteA = import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "A"))
EmcRes = Emc(GutContents_SiteA, replicates=499)
sumMC.RInSp(EmcRes)
rm(list=ls(all=TRUE))



