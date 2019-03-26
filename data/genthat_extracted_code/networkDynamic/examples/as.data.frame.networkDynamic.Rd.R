library(networkDynamic)


### Name: as.data.frame.networkDynamic
### Title: Extracts the edge timing information from a networkDynamic
###   object and represent as a data.frame.
### Aliases: as.data.frame.networkDynamic

### ** Examples

net <-network.initialize(3)
net[1,2]<-1;
net[2,3]<-1;
## censoring
activate.edges(net,onset=1,terminus=Inf,e=1)
activate.edges(net,onset=2,terminus=3,e=2)
activate.vertices(net, onset=1, terminus=Inf, v=1)
as.data.frame(net)



