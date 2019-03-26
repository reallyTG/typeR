library(igraph)


### Name: subgraph_centrality
### Title: Find subgraph centrality scores of network positions
### Aliases: subgraph_centrality subgraph.centrality
### Keywords: graphs

### ** Examples


g <- sample_pa(100, m=4, dir=FALSE)
sc <- subgraph_centrality(g)
cor(degree(g), sc)




