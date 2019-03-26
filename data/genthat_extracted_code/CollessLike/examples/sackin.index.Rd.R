library(CollessLike)


### Name: sackin.index
### Title: Computes the Sackin balance index of a phylogenetic tree
### Aliases: sackin.index

### ** Examples

# Computation of the Sackin balance index of trees 
# entered in newick format:
sackin.index("(1,2,3,4,5);")
sackin.index("(1,(2,(3,(4,5))));")

# Computation of the Sackin balance index of trees 
# entered as a phylo object:
require(ape)
random.tree = rtree(5,rooted=TRUE)
sackin.index(random.tree)

# Computation of the Sackin balance index of a tree
# entered as a igraph object. The tree is randomly 
# generated from all trees with 5 leaves following
# the alpha-gamma model with alpha=0.5 and gamma=0.3.
a.g.tree = a.g.model(5,0.5,0.3)
sackin.index(a.g.tree)

#All of them can be normalized (values between 0 and 1)
sackin.index("(1,2,3,4,5);",norm=TRUE)
sackin.index("(1,(2,(3,(4,5))));",norm=TRUE)
sackin.index(random.tree,norm=TRUE)
sackin.index(a.g.tree,norm=TRUE)




