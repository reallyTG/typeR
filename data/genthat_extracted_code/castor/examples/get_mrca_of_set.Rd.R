library(castor)


### Name: get_mrca_of_set
### Title: Most recent common ancestor of a set of tips/nodes.
### Aliases: get_mrca_of_set
### Keywords: MRCA

### ** Examples

# generate a random tree
Ntips = 1000
tree = generate_random_tree(list(birth_rate_intercept=1),Ntips)$tree

# pick 3 random tips or nodes
descendants = sample.int(n=(Ntips+tree$Nnode), size=3, replace=FALSE)

# calculate MRCA of picked descendants
mrca = get_mrca_of_set(tree, descendants)



