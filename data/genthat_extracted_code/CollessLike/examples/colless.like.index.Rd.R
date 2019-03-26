library(CollessLike)


### Name: colless.like.index
### Title: Computes the Colless-like balance index of a phylogenetic tree
### Aliases: colless.like.index

### ** Examples

# Computation of the Colless-Like balance index of trees 
# entered in newick format:
colless.like.index("(1,2,3,4,5);")
colless.like.index("(1,(2,(3,(4,5))));")

# Computation of the Colless-Like balance index of trees 
# entered as a phylo object:
require(ape)
random.tree = rtree(5,rooted=TRUE)
colless.like.index(random.tree)

# Computation of the Colless-Like balance index of a tree
# entered as a igraph object. The tree is randomly 
# generated from all trees with 5 leaves following
# the alpha-gamma model with alpha=0.5 and gamma=0.3.
a.g.tree = a.g.model(5,0.5,0.3)
colless.like.index(a.g.tree)

# All of them can be normalized (values between 0 and 1)
colless.like.index("(1,2,3,4,5);",norm=TRUE)
colless.like.index("(1,(2,(3,(4,5))));",norm=TRUE)
colless.like.index(random.tree,norm=TRUE)
colless.like.index(a.g.tree,norm=TRUE)

# Computation of the Colless-Like balance index of the
# previous generated tree with f-size function f(n)=exp(n):
colless.like.index(a.g.tree,f.size="exp")

# Computation of the Colless-Like balance index of the 
# previous generated tree that sets the sample variance 
# and the sample standard deviation as dissimilarity.
colless.like.index(a.g.tree,diss="var")
colless.like.index(a.g.tree,diss="sd")

# Computation of the Colless-Like balance index of the 
# previous generated tree with f-size function f(n)=exp(n)
# that sets the sample variance and the sample standard 
# deviation as dissimilarity.
colless.like.index(a.g.tree,f.size="exp",diss="var")
colless.like.index(a.g.tree,f.size="exp",diss="sd")




