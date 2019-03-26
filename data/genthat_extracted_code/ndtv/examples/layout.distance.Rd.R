library(ndtv)


### Name: layout.distance
### Title: Provides a default way to convert a network into a set of
###   euclidian distances suitable for MDS-style layout optimization.
### Aliases: layout.distance

### ** Examples

test<-network.initialize(4)
add.edges(test,tail=1:2,head=2:3)
# in adjacency matrix form
as.matrix(test)
# as matrix of geodesic distances
layout.distance(test,1.5)




