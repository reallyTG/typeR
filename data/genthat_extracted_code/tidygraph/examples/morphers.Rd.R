library(tidygraph)


### Name: morphers
### Title: Functions to generate alternate representations of graphs
### Aliases: morphers to_linegraph to_subgraph to_subcomponent to_split
###   to_components to_complement to_local_neighborhood to_dominator_tree
###   to_minimum_spanning_tree to_shortest_path to_bfs_tree to_dfs_tree
###   to_simple to_contracted to_unfolded_tree to_directed to_undirected
###   to_hierarchical_clusters

### ** Examples

# Compute only on a subgraph of every even node
create_notable('meredith') %>%
  morph(to_subgraph, seq_len(graph_order()) %% 2 == 0) %>%
  mutate(neighbour_count = centrality_degree()) %>%
  unmorph()



