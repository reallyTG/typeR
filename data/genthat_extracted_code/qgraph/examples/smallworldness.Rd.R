library(qgraph)


### Name: smallworldness
### Title: Compute the small-worldness index.
### Aliases: smallworldness
### Keywords: smallworld transitivity

### ** Examples

set.seed(1)
# a regular lattice. Even if the small-worldness is higher than three, the average path length is 
# much higher than that of random networks.
regnet<-igraph::watts.strogatz.game(dim=1, size=1000, nei=10, p=0, loops=FALSE, multiple=FALSE)
smallworldness(regnet, B=10)

## Not run: 
##D # a small-world network: the transitivity is much higher than random, the average path length is 
##D # close to that of random networks
##D swnet<-igraph::watts.strogatz.game(dim=1, size=1000, nei=10, p=.1, loops=FALSE, multiple=FALSE)
##D smallworldness(swnet, B=10)
##D 
##D # a pseudorandom network: both the average path length and the transitivity are similar to random 
##D # networks.
##D rndnet<-igraph::watts.strogatz.game(dim=1, size=1000, nei=10, p=1, loops=FALSE, multiple=FALSE)
##D smallworldness(rndnet, B=10)
## End(Not run)



