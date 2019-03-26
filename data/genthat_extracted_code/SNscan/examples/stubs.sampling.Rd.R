library(SNscan)


### Name: stubs.sampling
### Title: Generate Random Graph
### Aliases: stubs.sampling
### Keywords: graph sampling

### ** Examples

library(igraph)
par(mfrow=c(2,1))
g <- graph.ring(10);plot(g)
Sg=stubs.sampling(s=10, g=g)
sg=graph(Sg[1,],n=V(g),directed=FALSE);plot(sg)



