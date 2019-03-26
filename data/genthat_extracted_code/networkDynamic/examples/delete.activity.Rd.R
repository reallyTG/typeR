library(networkDynamic)


### Name: delete.activity
### Title: Remove Timing Information in a Dynamically Extended Network
###   Object
### Aliases: delete.edge.activity delete.vertex.activity
### Keywords: ~kwd1 ~kwd2

### ** Examples

  library(networkDynamic)
  data(flo)
  net1 <- network(flo)
  activate.edges(net1)
  activate.vertices(net1)
  net2 <- net1
  delete.edge.activity(net1, e=seq(2,40,2))
  delete.edge.activity(net2)
  delete.vertex.activity(net2)
  is.active(net1, at=0, e=c(1,2), active.default=FALSE)
  is.active(net1, at=0, e=c(1,2), active.default=TRUE)
  is.active(net2, at=0, e=1:16, active.default=FALSE)
  is.active(net2, at=0, e=1:16, active.default=TRUE)



