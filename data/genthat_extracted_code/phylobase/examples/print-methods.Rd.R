library(phylobase)


### Name: print
### Title: print a phylogeny
### Aliases: print print,phylo4-method show show,phylo4-method names
###   names,phylo4-method head head,phylo4-method tail tail,phylo4-method
### Keywords: methods

### ** Examples



tree.phylo <- ape::read.tree(text="((a,b),c);")
tree <- as(tree.phylo, "phylo4")
##plot(tree,show.node=TRUE) ## plotting broken with empty node labels: FIXME
tip.data <- data.frame(size=c(1,2,3), row.names=c("a", "b", "c"))
treedata <- phylo4d(tree, tip.data)
plot(treedata)
print(treedata)





