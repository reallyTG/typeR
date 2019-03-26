library(treeplyr)


### Name: treedply
### Title: Run a function on a 'treedata' object
### Aliases: treedply treedply.treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
treedply(td, geiger::fitContinuous(phy, getVector(td, SVL), model="BM", ncores=1))
treedply(td, phytools::phylosig(phy, getVector(td, awesomeness), "lambda", test=TRUE))
treedply(td, phytools::phenogram(phy, getVector(td, SVL), ftype="off", spread.labels=FALSE))



