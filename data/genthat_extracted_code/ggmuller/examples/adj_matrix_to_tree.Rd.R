library(ggmuller)


### Name: adj_matrix_to_tree
### Title: Create a tree object of class "phylo" from an adjacency matrix
### Aliases: adj_matrix_to_tree

### ** Examples

edges1 <- data.frame(Parent = c(1,1,1,3,3), Identity = 2:6)
require(ape)
tree <- adj_matrix_to_tree(edges1)
plot(tree)




