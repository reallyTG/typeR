library(treeplyr)


### Name: mutate_.treedata
### Title: Function for mutating an object of class 'treedata'
### Aliases: mutate_.treedata mutate.treedata mutate.grouped_treedata
###   mutate_.grouped_treedata mutate_.grouped_treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
tdmutate <- mutate(td, lnSVL = log(SVL), badassery = awesomeness + hostility)



