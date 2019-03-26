library(igraph)


### Name: make_de_bruijn_graph
### Title: De Bruijn graphs
### Aliases: make_de_bruijn_graph graph.de.bruijn de_bruijn_graph
### Keywords: graphs

### ** Examples


# de Bruijn graphs can be created recursively by line graphs as well
g <- make_de_bruijn_graph(2,1)
make_de_bruijn_graph(2,2)
make_line_graph(g)



