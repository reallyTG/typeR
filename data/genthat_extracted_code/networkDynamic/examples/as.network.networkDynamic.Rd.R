library(networkDynamic)


### Name: as.network.networkDynamic
### Title: Remove 'networkDynamic' class name from networkDynamic object.
### Aliases: as.network.networkDynamic

### ** Examples

test<-network.initialize(2)
add.edges.active(test,tail=1,head=2,onset=1,terminus=2)
is.networkDynamic(test)
test<-as.network(test)
is.networkDynamic(test)




