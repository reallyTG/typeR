library(treespace)


### Name: relatedTreeDist
### Title: Tree distance when trees have "related" tips
### Aliases: relatedTreeDist

### ** Examples

# we will simulate some trees as an example, each "based" on the same tree:
baseTree <- rtree(5)
baseTree$tip.label <- letters[5:1]
plot(baseTree)

tree1 <- simulateIndTree(baseTree, itips=3, permuteTips=FALSE)
tree2 <- simulateIndTree(baseTree, itips=4, permuteTips=FALSE)
tree3 <- simulateIndTree(baseTree, itips=4, permuteTips=TRUE, tipPercent=20)
tree4 <- simulateIndTree(baseTree, itips=4, permuteTips=TRUE, tipPercent=60)
tree5 <- simulateIndTree(baseTree, itips=4, permuteTips=TRUE, tipPercent=100)
# combine:
trees <- list(tree1,tree2,tree3,tree4,tree5)

df <- cbind(sort(rep(letters[1:5],4)),sort(paste0(letters[1:5],"_",rep(1:4,5))))
head(df)

# Find distances:
relatedTreeDist(trees,df)

# Note that trees 1 and 2 have different numbers of tips but the relationships between those tips
# are identical at the category level, hence the related tree distance is 0.
# We can see that the distances between trees increase the more the trees are permuted.





