library(igraph)


### Name: component_distribution
### Title: Connected components of a graph
### Aliases: component_distribution components no.clusters clusters
###   is.connected cluster.distribution count_components is_connected
### Keywords: graphs

### ** Examples


g <- sample_gnp(20, 1/20)
clu <- components(g)
groups(clu)




