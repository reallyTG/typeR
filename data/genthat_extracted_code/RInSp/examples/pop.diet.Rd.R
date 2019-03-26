library(RInSp)


### Name: pop.diet
### Title: Calculate population diet
### Aliases: pop.diet
### Keywords: function utilities

### ** Examples

data(Stickleback)
# Select a single spatial sampling site (site D)
GutContents_SiteD = import.RInSp(Stickleback, row.names = 1, info.cols = c(2:13),
subset.rows = c("Site", "D"))
PopDiet = pop.diet(GutContents_SiteD, prop = "average")
rm(list=ls(all=TRUE))



