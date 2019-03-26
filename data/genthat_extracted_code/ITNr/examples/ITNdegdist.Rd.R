library(ITNr)


### Name: ITNdegdist
### Title: ITN Degree Distribution
### Aliases: ITNdegdist

### ** Examples

require(igraph)

##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Plot degree distribution
deg_dist_plot<-ITNdegdist(ITN)




