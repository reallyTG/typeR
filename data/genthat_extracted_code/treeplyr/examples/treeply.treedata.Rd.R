library(treeplyr)


### Name: treeply
### Title: Run a function on the phylogeny of a 'treedata' object
### Aliases: treeply treeply.treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
td2 <- treeply(td, drop.tip, 1:50)
  
par(mfrow=c(1,2))
plot(td$phy)
plot(td2$phy)




