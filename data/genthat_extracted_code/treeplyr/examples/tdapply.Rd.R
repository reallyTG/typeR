library(treeplyr)


### Name: tdapply
### Title: Apply a function over all treedata object columns and return a
###   list of results, analogously to the normal apply function
### Aliases: tdapply

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
td %>% forceNumeric(.) %>% tdapply(., 2, phytools::phylosig, tree=phy)



