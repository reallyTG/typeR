library(networkDynamic)


### Name: print.networkDynamic
### Title: Provide a view of a networkDynamic object including timing
###   information
### Aliases: print.networkDynamic

### ** Examples

  library(networkDynamic)
  data(flo)
  net1 <- network(flo)
  activate.edges(net1, onset=1:20, terminus=101:120)
  activate.vertices(net1, at=seq(2,32,2))
  print(net1)



