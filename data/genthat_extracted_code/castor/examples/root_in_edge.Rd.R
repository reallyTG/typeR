library(castor)


### Name: root_in_edge
### Title: Root or re-root a tree in the middle of an edge.
### Aliases: root_in_edge

### ** Examples

# generate a random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# reroot the tree inside some arbitrary edge
focal_edge = 120
tree = root_in_edge(tree, focal_edge)



