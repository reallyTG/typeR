library(tidygraph)


### Name: node_topology
### Title: Node properties related to the graph topology
### Aliases: node_topology node_dominator node_topo_order

### ** Examples

# Sort a graph based on its topological order
create_tree(10, 2) %>%
  arrange(sample(graph_order())) %>%
  mutate(old_ind = seq_len(graph_order())) %>%
  arrange(node_topo_order())



