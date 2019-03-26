library(network)


### Name: network.density
### Title: Compute the Density of a Network
### Aliases: network.density
### Keywords: graphs

### ** Examples

#Create an arbitrary adjacency matrix
m<-matrix(rbinom(25,1,0.5),5,5)
diag(m)<-0

g<-network.initialize(5)    #Initialize the network
network.density(g)          #Calculate the density



