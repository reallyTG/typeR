library(networkDynamic)


### Name: age.at
### Title: Age of active edges or vertices at a query time point
### Aliases: edges.age.at dyads.age.at vertices.age.at

### ** Examples

# set up an example network for testing
test<-network.initialize(5)
add.edges(test,tail = 1:4,head=2:5 )
activate.edges(test,onset=0:2,terminus=c(2,3,3),e=1:3)
activate.vertices(test,v = 1:4,onset=-3:0,terminus=5:8)

# how old are each of the edges at time point 2.0 ?
edges.age.at(test,at=2.0)

# how old is vertex id 2 time point 3
vertices.age.at(test,at=3, v=2)

# how old are the edges [1,2] and [3,4] at time point 2
dyads.age.at(test,at=2,tails=c(1,3),heads=c(2,4))

dyads.age.at(test,at=2,format.out='matrix')




