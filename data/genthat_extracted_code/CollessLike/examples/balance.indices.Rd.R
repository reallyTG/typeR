library(CollessLike)


### Name: balance.indices
### Title: Computes Colles-like, Sackin and cophenetic balance indices of a
###   phylogenetic tree.
### Aliases: balance.indices

### ** Examples

# Computation of the Colless-Like, Sackin and Cophenetic 
# balance indices of trees entered in newick format:
balance.indices("(1,2,3,4,5);")
balance.indices("(1,(2,(3,(4,5))));")

# Computation of the Colless-Like, Sackin and Cophenetic
# balance indices of a tree entered as a phylo object:
require(ape)
random.tree = rtree(5,rooted=TRUE)
balance.indices(random.tree)

# Computation of the Colless-Like, Sackin and Cophenetic 
# balance indices of a tree entered as a igraph object.
# The tree is randomly generated from all trees with 5
# leaves following the alpha-gamma model with alpha=0.5
# and gamma=0.3.
a.g.tree = a.g.model(5,0.5,0.3)
balance.indices(a.g.tree)

# All of them can be normalized (values between 0 and 1)
balance.indices("(1,2,3,4,5);",norm=TRUE)
balance.indices("(1,(2,(3,(4,5))));",norm=TRUE)
balance.indices(random.tree,norm=TRUE)
balance.indices(a.g.tree,norm=TRUE)




