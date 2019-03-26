library(networkDynamic)


### Name: network.dynamic.check
### Title: Verify a Dynamically Extended Network Object
### Aliases: network.dynamic.check is.networkDynamic
### Keywords: ~kwd1 ~kwd2

### ** Examples

  test <-network.initialize(2) # make a network
  # only activate one vertex
  activate.vertices(test,onset=2,length=5,v=1) 
  test[1,2] <-1 # add an edge between the verticies
  # activate the edge for a spell not including vertex spell
  activate.edges(test,onset=0,terminus=7, e=1) 
  network.dynamic.check(test) # find the bad edge
  
  # name a vertex attrible like a TEA but with the wrong structure
  set.vertex.attribute(test,'letters','a')
  network.dynamic.check(test)



