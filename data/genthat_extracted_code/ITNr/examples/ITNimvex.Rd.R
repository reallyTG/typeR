library(ITNr)


### Name: ITNimvex
### Title: ITN - Exports vs Imports Plot
### Aliases: ITNimvex

### ** Examples

require(igraph)

##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Plot binary import vs exports
imvex_plot<-ITNimvex(ITN,FALSE)



