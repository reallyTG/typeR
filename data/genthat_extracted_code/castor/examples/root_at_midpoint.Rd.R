library(castor)


### Name: root_at_midpoint
### Title: Root or re-root a tree at the midpoint node.
### Aliases: root_at_midpoint

### ** Examples

# generate a random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# reroot the tree at its midpoint node
tree = root_at_midpoint(tree)



