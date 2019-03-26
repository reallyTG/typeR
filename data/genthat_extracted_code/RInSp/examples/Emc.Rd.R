library(RInSp)


### Name: Emc
### Title: Monte Carlo resampling procedure for index E and Cws
### Aliases: Emc
### Keywords: univar models

### ** Examples


# Example with stickleback data from Bolnick and Paull 2009
data(Stickleback)
# Select a single spatial sampling site (site B)
GutContents_SiteB <- import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "B"))
# Warning, the number of replicates is set low to speed up the example!
# Note, for real analyses we recommend to set replicates => 999
ResEmc <- Emc(GutContents_SiteB, popd.type = "average", replicates = 249)

# This Eadj re-scales the observed E value to range from 0 when
# it is equal to the null expectation, up to a maximum of 1.
# This allows comparison of E values across samples with
# different null Es.
# For example, consider a case with no individual specialization
Nulldata <- Null.Hp.RInSp(GutContents_SiteB, prop="average")
# Warning, the number of replicates is set low to speed up he example!
# Note, for real analyses we recommend to set replicates => 999
EmcNull <- Emc(Nulldata, popd.type = "average", replicates = 249)
rm(list=ls(all=TRUE))



