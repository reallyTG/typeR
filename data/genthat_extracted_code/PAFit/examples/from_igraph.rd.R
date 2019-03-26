library(PAFit)


### Name: from_igraph
### Title: Convert an igraph object to a PAFit_net object
### Aliases: from_igraph

### ** Examples

  library("PAFit")
  # a network from Bianconi-Barabasi model
  net          <- generate_BB(N = 50 , m = 10 , s = 10)
  igraph_graph <- to_igraph(net)
  back         <- from_igraph(igraph_graph)



