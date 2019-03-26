library(igraph)


### Name: igraph_options
### Title: Parameters for the igraph package
### Aliases: igraph_options igraph.options getIgraphOpt igraph_opt
###   igraph_opt
### Keywords: graphs

### ** Examples


oldval <- igraph_opt("verbose")
igraph_options(verbose = TRUE)
layout_with_kk(make_ring(10))
igraph_options(verbose = oldval)

oldval <- igraph_options(verbose = TRUE, sparsematrices = FALSE)
make_ring(10)[]
igraph_options(oldval)
igraph_opt("verbose")




