library(tidygraph)


### Name: bind_graphs
### Title: Add graphs, nodes, or edges to a tbl_graph
### Aliases: bind_graphs bind_nodes bind_edges

### ** Examples

graph <- create_notable('bull')
new_graph <- create_notable('housex')

# Add nodes
graph %>% bind_nodes(data.frame(new = 1:4))

# Add edges
graph %>% bind_edges(data.frame(from = 1, to = 4:5))

# Add graphs
graph %>% bind_graphs(new_graph)




