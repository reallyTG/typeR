library(RInSp)


### Name: RInSp2vegan
### Title: Vegan support procedure
### Aliases: RInSp2vegan
### Keywords: univar models

### ** Examples

data(Stickleback)
# Select a single spatial sampling site (site D)
GutContents = import.RInSp(Stickleback, row.names = 1, info.cols = c(2:13))
risul = RInSp2vegan(GutContents)
rm(list=ls(all=TRUE))



