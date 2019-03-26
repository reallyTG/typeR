library(ergm)


### Name: as.network.numeric
### Title: Create a Simple Random network of a Given Size
### Aliases: as.network.numeric
### Keywords: classes graphs

### ** Examples


#Draw a random directed network with 25 nodes
g<-network(25)
#Draw a random undirected network with density 0.1
g<-network(25, directed=FALSE, density=0.1)
#Draw a random bipartite network with 10 events and 5 actors and density 0.1
g<-network(5, bipartite=10, density=0.1)



