library(phylobase)


### Name: phylo4-methods
### Title: Create a phylogenetic tree
### Aliases: phylo4-methods phylo4 phylo4_orderings phylo4,matrix-method
###   phylo4,phylo-method phylo4,nexml-method nexml,phylo4-method
### Keywords: datasets

### ** Examples


# a three species tree:
mytree <- phylo4(x=matrix(data=c(4,1, 4,5, 5,2, 5,3, 0,4), ncol=2,
byrow=TRUE), tip.label=c("speciesA", "speciesB", "speciesC")) 
mytree
plot(mytree)

# another way to specify the same tree:
mytree <- phylo4(x=cbind(c(4, 4, 5, 5, 0), c(1, 5, 2, 3, 4)),
tip.label=c("speciesA", "speciesB", "speciesC")) 

# another way:
mytree <- phylo4(x=rbind(c(4, 1), c(4, 5), c(5, 2), c(5, 3), c(0, 4)),
tip.label=c("speciesA", "speciesB", "speciesC")) 

# with branch lengths:
mytree <- phylo4(x=rbind(c(4, 1), c(4, 5), c(5, 2), c(5, 3), c(0, 4)),
tip.label=c("speciesA", "speciesB", "speciesC"), edge.length=c(1, .2,
.8, .8, NA))
plot(mytree)




