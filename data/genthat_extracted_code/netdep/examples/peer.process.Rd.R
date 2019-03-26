library(netdep)


### Name: peer.process
### Title: Generate direct transmission process
### Aliases: peer.process

### ** Examples

library(netdep)
library(igraph)
library(stats)
G = latent.netdep(n.node = 100, rho = 0.2)
A = as.matrix(get.adjacency(G))
outcomes = peer.process(A, max.time = 3, mprob = 0.3, epsilon = 0.5)





