library(ITNr)


### Name: ITNhistdegdist
### Title: ITN Histogram Degree Distribution
### Aliases: ITNhistdegdist

### ** Examples

require(igraph)

##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Add edge weights
E(ITN)$weight<-runif(ecount(ITN), 0, 1)

##Plot degree distribution histogram
hist_deg_dist<-ITNhistdegdist(ITN)



