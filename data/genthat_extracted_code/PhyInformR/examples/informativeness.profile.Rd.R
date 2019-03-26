library(PhyInformR)


### Name: informativeness.profile
### Title: A function to plot phylogenetic informativeness profiles
### Aliases: informativeness.profile
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("ape")
library("splines")
read.tree(system.file("extdata","polypterus_trees.phy",package="PhyInformR"))->trees
trees[[1]]->tree
as.matrix(rag1)->rates
informativeness.profile(rates, tree, codon = "FALSE", values = "display")



