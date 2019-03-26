library(igraph)


### Name: cluster_infomap
### Title: Infomap community finding
### Aliases: cluster_infomap infomap.community
### Keywords: graphs

### ** Examples


## Zachary's karate club
g <- make_graph("Zachary")

imc <- cluster_infomap(g)
membership(imc)
communities(imc)




