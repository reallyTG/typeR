library(ITNr)


### Name: get.backbone
### Title: get.backbone
### Aliases: get.backbone

### ** Examples

require(igraph)

##Create a random (directed) network
gs<-erdos.renyi.game(50,0.2,directed = TRUE)

##Add edge weights to the network
E(gs)$weight<-runif(ecount(gs), 0, 1)

##Extract backbone at 0.05 significance level
backbone<-get.backbone(gs,0.1)




