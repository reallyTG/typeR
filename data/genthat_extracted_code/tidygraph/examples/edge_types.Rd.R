library(tidygraph)


### Name: edge_types
### Title: Querying edge types
### Aliases: edge_types edge_is_multiple edge_is_loop edge_is_mutual
###   edge_is_from edge_is_to edge_is_between edge_is_incident

### ** Examples

create_star(10, directed = TRUE, mutual = TRUE) %>%
  activate(edges) %>%
  sample_frac(0.7) %>%
  mutate(single_edge = !edge_is_mutual())



