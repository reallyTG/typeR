library(RInSp)


### Name: Eindex
### Title: Calculate index E and Cws
### Aliases: Eindex
### Keywords: univar models

### ** Examples

# Eindex example with data from Bolnick and Paull (2009)
data(Stickleback)
# Select a single spatial sampling site (site B)
GutContents_SiteB <- import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "B"))
# Index calculation with jackknife variance estimate
# This can take time for big data sets
Eresult <- Eindex(GutContents_SiteB, index = "saramaki", jackknife = TRUE)
rm(list=ls(all=TRUE))



