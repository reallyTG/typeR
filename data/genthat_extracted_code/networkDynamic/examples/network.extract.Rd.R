library(networkDynamic)


### Name: network.extract
### Title: Temporal Extracts/Cross-sections of Dynamically Extended Network
###   Objects
### Aliases: network.extract %t%

### ** Examples


triangle <- network.initialize(3)    # create a toy network

# add edges with activity
# first add an edge between vertices 1 and 2
add.edges.active(triangle,onset=0,terminus=10,tail=1,head=2)
# add a more edges
add.edges.active(triangle,onset=0,length=4,tail=2,head=3)      
add.edges.active(triangle,at=4.5,tail=3,head=1)

# specify some vertex activity
activate.vertices(triangle,onset=0,terminus=10)
deactivate.vertices(triangle,onset=1,terminus=2,v=3)

degree<-function(x){as.vector(rowSums(as.matrix(x)) 
  + colSums(as.matrix(x)))} # handmade degree function

degree(triangle) # degree of each vertex, ignoring time

degree(network.extract(triangle,at=0))
degree(network.extract(triangle,at=1)) # just look at t=1
degree(network.extract(triangle,at=2))
degree(network.extract(triangle,at=5))

# watch out for empty networks! they are just an empty list
t10 <- network.extract(triangle,at=10)
t10

# notice difference between 'at' syntax and 'onset,terminus'
# when network is not in discrete time
degree(network.extract(triangle,at=4))
degree(network.extract(triangle,onset=4,terminus=5))

# the %t% (time) operator is like an alias for the 'at' extraction syntax
degree(triangle%t%4)

par(mfrow=c(2,2))
#show multiple plots
plot(triangle,main='ignoring dynamics',displaylabels=TRUE)
plot(network.extract(triangle,onset=1,terminus=2),main='at time 1',displaylabels=TRUE)
plot(network.extract(triangle,onset=2,terminus=3),main='at time 2',displaylabels=TRUE)
plot(network.extract(triangle,onset=5,terminus=6),main='at time 5',displaylabels=TRUE)




