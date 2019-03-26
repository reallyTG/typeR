library(tidygraph)


### Name: with_graph
### Title: Evaluate a tidygraph algorithm in the context of a graph
### Aliases: with_graph

### ** Examples

gr <- play_erdos_renyi(10, 0.3)

with_graph(gr, centrality_degree())




