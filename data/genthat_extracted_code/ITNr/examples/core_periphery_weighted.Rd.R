library(ITNr)


### Name: core_periphery_weighted
### Title: Core-Periphery for Weighted Networks
### Aliases: core_periphery_weighted

### ** Examples

require(igraph)
##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(50,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Add vertex names
V(ITN)$name<-1:vcount(ITN)

##Implement core-periphery algorithm
ITNcp<-core_periphery_weighted(ITN,"directed")



