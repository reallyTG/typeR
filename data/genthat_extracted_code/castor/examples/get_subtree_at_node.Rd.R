library(castor)


### Name: get_subtree_at_node
### Title: Extract a subtree descending from a specific node.
### Aliases: get_subtree_at_node
### Keywords: pruning subtree

### ** Examples

# generate a random tree
Ntips = 1000
tree = generate_random_tree(list(birth_rate_intercept=1),Ntips)$tree

# extract subtree descending from a random node
node = sample.int(tree$Nnode,size=1)
subtree = get_subtree_at_node(tree, node)$subtree

# print summary of subtree
cat(sprintf("Subtree at %d-th node has %d tips\n",node,length(subtree$tip.label)))



