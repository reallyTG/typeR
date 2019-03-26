library(phangorn)


### Name: designTree
### Title: Compute a design matrix or non-negative LS
### Aliases: designTree nnls.tree nnls.phylo nnls.splits nnls.networx
###   designSplits
### Keywords: cluster

### ** Examples


example(NJ)
dm <-  as.matrix(dm)
y <- dm[lower.tri(dm)]
X <- designTree(tree)
lm(y~X-1)
# avoids negative edge weights 
tree2 = nnls.tree(dm, tree)




