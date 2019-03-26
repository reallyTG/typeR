library(tidygraph)


### Name: search_graph
### Title: Search a graph with depth first and breath first
### Aliases: search_graph bfs_rank bfs_parent bfs_before bfs_after bfs_dist
###   dfs_rank dfs_rank_out dfs_parent dfs_dist

### ** Examples

# Get the depth of each node in a tree
create_tree(10, 2) %>%
  activate(nodes) %>%
  mutate(depth = bfs_dist(root = 1))

# Reorder nodes based on a depth first search from node 3
create_notable('franklin') %>%
  activate(nodes) %>%
  mutate(order = dfs_rank(root = 3)) %>%
  arrange(order)




