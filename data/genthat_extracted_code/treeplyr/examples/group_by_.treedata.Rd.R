library(treeplyr)


### Name: group_by_.treedata
### Title: Function for grouping an object of class 'treedata'
### Aliases: group_by_.treedata group_by.treedata ungroup.grouped_treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
tdGrouped <- group_by(td, ecomorph)
summarize(tdGrouped, ntips = length(phy$tip.label), 
   totalBL = sum(phy$edge.length), meanSVL = mean(SVL), sdSVL = sd(SVL))



