library(ape)


### Name: hivtree
### Title: Phylogenetic Tree of 193 HIV-1 Sequences
### Aliases: hivtree hivtree.newick hivtree.table
### Keywords: datasets

### ** Examples

# example tree in NH format (a string)
data("hivtree.newick") 
hivtree.newick

# generate file "hivtree.phy" in working directory
cat(hivtree.newick, file = "hivtree.phy", sep = "\n")
tree.hiv <- read.tree("hivtree.phy") # load tree
unlink("hivtree.phy") # delete the file "hivtree.phy"

plot(tree.hiv)

# table with list of internode distances
data("hivtree.table") 
hivtree.table


# construct coalescence intervals
ci <- coalescent.intervals(tree.hiv) # from tree
ci <- coalescent.intervals(hivtree.table$size) #from intervals
ci



