library(RInSp)


### Name: Likelihood and Wi
### Title: Likelihood measure of niche breadth
### Aliases: like.Wi
### Keywords: function utilities

### ** Examples

# Likelihood and Wi example with stickleback data
# from Bolnick and Paull 2009
data(Stickleback)
# Select a single spatial sampling site (site D)
SiteD = import.RInSp(Stickleback, row.names = 1,
info.cols = c(2:13), subset.rows = c("Site", "D"))
Wi = like.Wi(SiteD)
rm(list=ls(all=TRUE))



