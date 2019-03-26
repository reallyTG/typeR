library(RInSp)


### Name: NODF
### Title: Nestedness metric based on overlap and decreasing fill
### Aliases: NODF
### Keywords: univar models

### ** Examples

# NODF example with stickleback data from Bolnick and Paull 2009
data(Stickleback)
# Select a single spatial sampling site (site D)
SiteD = import.RInSp(Stickleback, row.names = 1, info.cols = c(2:13),
subset.rows = c("Site", "D"))
Nesting = NODF(SiteD)
rm(list=ls(all=TRUE))



