library(RInSp)


### Name: PSicalc
### Title: Calculate the proportional similarity index
### Aliases: PSicalc
### Keywords: function utilities

### ** Examples

# PSicalc example using stickleback data from Bolnick and Paull 2009
data(Stickleback)
# Select a single spatial sampling site (site A)
GutContents_SiteA <- import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "A"))
# Warning, the number of replicates is set low to speed up he example!
# Note, for real analyses we recommend to set replicates => 999
PSi <- PSicalc(GutContents_SiteA, exclude = FALSE, replicates = 99)
sumMC.RInSp(PSi)
rm(list=ls(all=TRUE))



