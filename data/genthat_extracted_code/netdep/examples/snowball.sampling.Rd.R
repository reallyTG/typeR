library(netdep)


### Name: snowball.sampling
### Title: Snowball sampling
### Aliases: snowball.sampling

### ** Examples

library(netdep)
library(igraph)
G = latent.netdep(n.node = 200, rho = 0.2, dep.factor = -3, dep.range = c(-10, 0))
subG = snowball.sampling(G, 100)




