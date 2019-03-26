library(tidygraph)


### Name: local_graph
### Title: Measures based on the neighborhood of each node
### Aliases: local_graph local_size local_members local_triangles
###   local_ave_degree local_transitivity

### ** Examples

# Get all neighbors of each graph
create_notable('chvatal') %>%
  activate(nodes) %>%
  mutate(neighborhood = local_members(mindist = 1))

# These are equivalent
create_notable('chvatal') %>%
  activate(nodes) %>%
  mutate(n_neighbors = local_size(mindist = 1),
         degree = centrality_degree()) %>%
  as_tibble()




