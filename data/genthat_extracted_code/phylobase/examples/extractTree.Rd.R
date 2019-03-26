library(phylobase)


### Name: extractTree
### Title: Get tree from tree+data object
### Aliases: extractTree
### Keywords: methods

### ** Examples

tree.phylo <- ape::read.tree(text = "((a,b),c);")
tree <- as(tree.phylo, "phylo4")
plot(tree)
tip.data <- data.frame(size = c(1, 2, 3), row.names = c("a", "b", "c"))
(treedata <- phylo4d(tree, tip.data))
plot(treedata)
(tree1 <- extractTree(treedata))
plot(tree1)




