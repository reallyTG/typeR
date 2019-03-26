library(PhyInformR)


### Name: PlotTreeSI
### Title: A funtion to visualize QIRP across a tree topology
### Aliases: PlotTreeSI
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("ape")
as.matrix(rag1)->rr
read.tree(system.file("extdata","polypterus_trees.phy",package="PhyInformR"))->trees
trees[[1]]->tree
PlotTreeSI(tree,rr,3)



