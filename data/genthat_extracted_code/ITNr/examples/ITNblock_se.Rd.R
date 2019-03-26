library(ITNr)


### Name: ITNblock_se
### Title: ITN Blockmodel & Structural Equivalence
### Aliases: ITNblock_se

### ** Examples

require(igraph)
require(sna)
require(intergraph)

##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(50,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Blockmodel & structural equivalence analysis
blockse<-ITNblock_se(ITN)




