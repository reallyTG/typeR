library(tidygraph)


### Name: centrality
### Title: Calculate node and edge centrality
### Aliases: centrality centrality_alpha centrality_authority
###   centrality_betweenness centrality_power centrality_closeness
###   centrality_eigen centrality_hub centrality_pagerank
###   centrality_subgraph centrality_degree centrality_edge_betweenness
###   centrality_manual centrality_closeness_harmonic
###   centrality_closeness_residual centrality_closeness_generalised
###   centrality_integration centrality_communicability
###   centrality_communicability_odd centrality_communicability_even
###   centrality_subgraph_odd centrality_subgraph_even centrality_katz
###   centrality_betweenness_network centrality_betweenness_current
###   centrality_betweenness_communicability
###   centrality_betweenness_rsp_simple centrality_betweenness_rsp_net
###   centrality_information centrality_decay centrality_random_walk
###   centrality_expected

### ** Examples

create_notable('bull') %>%
  activate(nodes) %>%
  mutate(importance = centrality_alpha())

# Most centrality measures are for nodes but not all
create_notable('bull') %>%
  activate(edges) %>%
  mutate(importance = centrality_edge_betweenness())



