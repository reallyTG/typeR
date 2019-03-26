library(networkDynamic)


### Name: get.timing.info
### Title: Retrieve the timing information present in a networkDynamic.
### Aliases: get.change.times get.edge.activity get.vertex.activity

### ** Examples

  library(networkDynamic)
  data(flo)
  net1 <- network(flo)
  activate.edges(net1, onset=1:20, terminus=101:120)
  activate.vertices(net1, at=seq(2,32,2))
  get.change.times(net1)
  get.edge.activity(net1)
  get.edge.activity(net1,as.spellList=TRUE)
  get.vertex.activity(net1)
  
  a <-network.initialize(5)
  activate.vertices(a,onset=0,terminus=Inf)
  get.change.times(a,ignore.inf=FALSE)





