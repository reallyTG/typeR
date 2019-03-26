library(VertexSort)


### Name: vertex.sort
### Title: Elucidates the hierarchical structure of a directed network
###   using the Vertex Sort algorithm
### Aliases: vertex.sort print.vertex.sort summary.vertex.sort
### Keywords: graphs

### ** Examples

  ## load the VertexSort library
  library(VertexSort)

  ## load interactions of the kinase-phosphatase network (kp-net)
  data("interactions")

  ## apply the Vertex Sort algorithm
  vs_kp_net <- vertex.sort(interactions)

  ## print the results (the contents of the vertex.sort object)
  vs_kp_net

  ## print a summary of the results
  summary(vs_kp_net)

  ## print levels.no, an element of the vertex.sort object
  vs_kp_net$levels.no



