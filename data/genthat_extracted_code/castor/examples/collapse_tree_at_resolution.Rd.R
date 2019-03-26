library(castor)


### Name: collapse_tree_at_resolution
### Title: Collapse nodes of a tree at a phylogenetic resolution.
### Aliases: collapse_tree_at_resolution
### Keywords: pruning subtree

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=1000)$tree

# print number of nodes
cat(sprintf("Simulated tree has %d nodes\n",tree$Nnode))

# collapse any nodes with tip-distances < 20
collapsed = collapse_tree_at_resolution(tree, resolution=20)$tree

# print number of nodes
cat(sprintf("Collapsed tree has %d nodes\n",collapsed$Nnode))



