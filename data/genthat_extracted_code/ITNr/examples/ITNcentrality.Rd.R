library(ITNr)


### Name: ITNcentrality
### Title: ITN Centrality
### Aliases: ITNcentrality

### ** Examples

require(igraph)
##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Add vertex names
V(ITN)$name<-1:vcount(ITN)

##Calculate the centrality measures
ITNCENT<-ITNcentrality(ITN)




