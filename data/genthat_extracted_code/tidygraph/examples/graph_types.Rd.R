library(tidygraph)


### Name: graph_types
### Title: Querying graph types
### Aliases: graph_types graph_is_simple graph_is_directed
###   graph_is_bipartite graph_is_connected graph_is_tree graph_is_forest
###   graph_is_dag graph_is_chordal graph_is_complete
###   graph_is_isomorphic_to graph_is_subgraph_isomorphic_to

### ** Examples

gr <- create_tree(50, 4)

with_graph(gr, graph_is_tree())




