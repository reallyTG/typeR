library(network)


### Name: has.edges
### Title: Determine if specified vertices of a network have any edges (are
###   not isolates)
### Aliases: has.edges is.isolate

### ** Examples

test<-network.initialize(5)
test[1,2]<-1
has.edges(test)
has.edges(test,v=5)



