library(treeplyr)


### Name: paint_clades
### Title: Add regimes to a treedata object
### Aliases: paint_clades

### ** Examples

data(anolis)
td <- make.treedata(anolis$phy, anolis$dat)
td <- reorder(td, "postorder")
td.painted <- paint_clades(td, interactive=FALSE, type="nodes", 
                                   ids=c(184, 160, 135, 122), plot=TRUE)
td.painted <- group_by(td.painted, clades)
summarise(td.painted, 
             psig1 = phytools::phylosig(setNames(SVL, phy$tip.label), tree=phy), 
                   meanSVL = mean(SVL))



