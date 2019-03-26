library(tidygraph)


### Name: context_accessors
### Title: Access graph, nodes, and edges directly inside verbs
### Aliases: context_accessors .G .N .E

### ** Examples


# Get data from the nodes while computing for the edges
create_notable('bull') %>%
  activate(nodes) %>%
  mutate(centrality = centrality_power()) %>%
  activate(edges) %>%
  mutate(mean_centrality = (.N()$centrality[from] + .N()$centrality[to])/2)



