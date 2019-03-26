library(igraph)


### Name: make_line_graph
### Title: Line graph of a graph
### Aliases: make_line_graph line.graph line_graph
### Keywords: graphs

### ** Examples


# generate the first De-Bruijn graphs
g <- make_full_graph(2, directed=TRUE, loops=TRUE)
make_line_graph(g)
make_line_graph(make_line_graph(g))
make_line_graph(make_line_graph(make_line_graph(g)))




