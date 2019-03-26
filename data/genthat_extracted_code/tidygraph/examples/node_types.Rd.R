library(tidygraph)


### Name: node_types
### Title: Querying node types
### Aliases: node_types node_is_cut node_is_root node_is_leaf node_is_sink
###   node_is_source node_is_isolated node_is_universal node_is_simplical
###   node_is_center node_is_adjacent node_is_keyplayer

### ** Examples

# Find the root and leafs in a tree
create_tree(40, 2) %>%
  mutate(root = node_is_root(), leaf = node_is_leaf())



