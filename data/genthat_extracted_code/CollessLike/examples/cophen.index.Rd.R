library(CollessLike)


### Name: cophen.index
### Title: Computes the cophenetic balance index of a phylogenetic tree
### Aliases: cophen.index

### ** Examples

# Computation of the cophenetic balance index of trees 
# entered in newick format:
cophen.index("(1,2,3,4,5);")
cophen.index("(1,(2,(3,(4,5))));")

# Computation of the cophenetic balance index of trees 
# entered as a phylo object:
require(ape)
random.tree = rtree(5,rooted=TRUE)
cophen.index(random.tree)

# Computation of the cophenetic balance index of a tree
# entered as a igraph object. The tree is randomly 
# generated from all trees with 5 leaves following
# the alpha-gamma model with alpha=0.5 and gamma=0.3.
a.g.tree = a.g.model(5,0.5,0.3)
cophen.index(a.g.tree)

#All of them can be normalized (values between 0 and 1)
cophen.index("(1,2,3,4,5);",norm=TRUE)
cophen.index("(1,(2,(3,(4,5))));",norm=TRUE)
cophen.index(random.tree,norm=TRUE)
cophen.index(a.g.tree,norm=TRUE)




