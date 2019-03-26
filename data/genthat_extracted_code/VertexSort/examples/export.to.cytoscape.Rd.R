library(VertexSort)


### Name: export.to.cytoscape
### Title: Facilitates export of results of the Vertex Sort algorithm to
###   Cytoscape
### Aliases: export.to.cytoscape
### Keywords: graphs Graphics

### ** Examples

  ## load the VertexSort library
  library(VertexSort)

  ## load interactions of the kinase-phosphatase network (kp-net)
  data("interactions")

  ## apply the vertex sort algorithm
  vs_kp_net <- vertex.sort(interactions)

  ## apply the export.to.cytoscape function
  df <- export.to.cytoscape(vs_kp_net)

  ## view the first 6 lines of each data frame
  head(df$edges)
  head(df$node_attribute)



