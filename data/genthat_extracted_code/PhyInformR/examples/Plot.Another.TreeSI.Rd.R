library(PhyInformR)


### Name: Plot.Another.TreeSI
### Title: A function to visualize QIRP of additional data across a tree
###   topology
### Aliases: Plot.Another.TreeSI
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("ape")
##First plot a locus
as.matrix(rag1)->rr
read.tree(system.file("extdata","polypterus_trees.phy",package="PhyInformR"))->trees
trees[[1]]->tree
PlotTreeSI(tree,rr,3)
##Now plot another locus to compare
as.matrix(prumetalrates[1:1594])->candidate_locus
Plot.Another.TreeSI(tree,candidate_locus,3, color="red",type=3)




