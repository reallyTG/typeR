library(RInSp)


### Name: WTdMC
### Title: Monte Carlo resampling of WIC/TNW for the discrete case
### Aliases: WTdMC
### Keywords: univar models

### ** Examples

data(Stickleback)
# Select a single spatial sampling site (site A)
GutContents_SiteA = import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "A"))
# Warning, the number of replicates is set low to speed up he example!
# Note, for real analyses we recommend to set replicates => 999
WT = WTdMC(GutContents_SiteA, replicates = 99)
sumMC.RInSp(WT)
rm(list=ls(all=TRUE))



