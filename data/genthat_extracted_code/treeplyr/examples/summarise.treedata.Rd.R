library(treeplyr)


### Name: summarise.treedata
### Title: Function for summarizing an object of class 'treedata'
### Aliases: summarise.treedata summarize.treedata
###   summarize.grouped_treedata summarise.grouped_treedata
###   summarise.grouped_treedata

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
summarize(td, ntips = length(phy$tip.label), meanSVL = mean(SVL), sdSVL = sd(SVL))
tdGrouped <- group_by(td, ecomorph)
summarize(tdGrouped, ntips = length(phy$tip.label), 
   totalBL = sum(phy$edge.length), meanSVL = mean(SVL), sdSVL = sd(SVL))



