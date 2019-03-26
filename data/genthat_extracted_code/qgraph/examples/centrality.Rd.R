library(qgraph)


### Name: centrality
### Title: Centrality statistics of graphs
### Aliases: centrality
### Keywords: graphs

### ** Examples

set.seed(1)
adj <- matrix(sample(0:1,10^2,TRUE,prob=c(0.8,0.2)),nrow=10,ncol=10)
Q <- qgraph(adj)

centrality(Q)



