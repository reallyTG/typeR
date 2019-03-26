library(NetworkSim)


### Name: netGDD
### Title: Calculate the Graphlet degree distribution (GDD) agreement
###   between two networks
### Aliases: netGDD

### ** Examples


 nodes <-names(igraph::V(databases.net))

 net1 <-subnet(databases.net,sample(nodes,100))

 net2 <-subnet(databases.net,sample(nodes,100))

 netGDD(net1,net2)




