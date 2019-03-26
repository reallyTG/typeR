library(ITNr)


### Name: ITNblock_plot
### Title: ITN Blockmodel Plot
### Aliases: ITNblock_plot

### ** Examples

require(igraph)
require(sna)
require(intergraph)

##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Blockmodel plot
block_plot<-ITNblock_plot(ITN,FALSE)




