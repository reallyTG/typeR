library(ITNr)


### Name: plot_degree_distribution
### Title: Plot Degree Distribution
### Aliases: plot_degree_distribution

### ** Examples

require(igraph)
##Create random International Trade Network (igraph object)
ITN<-erdos.renyi.game(75,0.05,directed = TRUE)

##Plot out degree distribution
plot_degree_distribution(ITN,"in")



