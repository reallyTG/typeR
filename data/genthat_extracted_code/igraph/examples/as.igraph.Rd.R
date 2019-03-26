library(igraph)


### Name: as.igraph
### Title: Conversion to igraph
### Aliases: as.igraph as.igraph.igraphHRG
### Keywords: graphs

### ** Examples


g <- make_full_graph(5) + make_full_graph(5)
hrg <- fit_hrg(g)
as.igraph(hrg)




