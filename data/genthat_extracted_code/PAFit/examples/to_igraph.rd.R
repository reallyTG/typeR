library(PAFit)


### Name: to_igraph
### Title: Convert a PAFit_net object to an igraph object
### Aliases: to_igraph

### ** Examples

library("PAFit")
# a network from Bianconi-Barabasi model
net          <- generate_BB(N = 50 , m = 10 , s = 10)
igraph_graph <- to_igraph(net)



