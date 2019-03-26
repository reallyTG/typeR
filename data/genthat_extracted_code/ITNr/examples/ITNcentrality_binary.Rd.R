library(ITNr)


### Name: ITNcentrality_binary
### Title: ITN Centrality for binary networks
### Aliases: ITNcentrality_binary

### ** Examples

require(igraph)
##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)


##Add vertex names
V(ITN)$name<-1:vcount(ITN)

##Calculate the centrality measures
ITNCENT<-ITNcentrality_binary(ITN)




