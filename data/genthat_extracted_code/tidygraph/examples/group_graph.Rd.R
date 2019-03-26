library(tidygraph)


### Name: group_graph
### Title: Group nodes and edges based on community structure
### Aliases: group_graph group_components group_edge_betweenness
###   group_fast_greedy group_infomap group_label_prop group_leading_eigen
###   group_louvain group_optimal group_spinglass group_walktrap
###   group_biconnected_component

### ** Examples

create_notable('tutte') %>%
  activate(nodes) %>%
  mutate(group = group_infomap())




