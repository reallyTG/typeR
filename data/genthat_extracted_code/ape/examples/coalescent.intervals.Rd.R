library(ape)


### Name: coalescent.intervals
### Title: Coalescent Intervals
### Aliases: coalescent.intervals coalescent.intervals.phylo
###   coalescent.intervals.default
### Keywords: manip

### ** Examples

data("hivtree.newick") # example tree in NH format
tree.hiv <- read.tree(text = hivtree.newick) # load tree
ci <- coalescent.intervals(tree.hiv) # from tree
ci
data("hivtree.table") # same tree, but in table format
ci <- coalescent.intervals(hivtree.table$size) # from vector of interval lengths
ci



