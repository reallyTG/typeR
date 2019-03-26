library(qgraph)


### Name: centrality_auto
### Title: Automatic centrality statistics of graphs
### Aliases: centrality_auto
### Keywords: graphs centrality

### ** Examples

set.seed(1)
adj <- matrix(sample(0:1,10^2,TRUE,prob=c(0.8,0.2)),nrow=10,ncol=10)
Q <- qgraph(adj)
centrality_auto(Q) 
# notice that a value NA is returned for the closeness centrality of nodes 3 and 9, which are not 
# strongly connected to the largest component of the network (3 cannot reach other nodes, 9 cannot 
# be reached).



