library(netdiffuseR)


### Name: igraph
### Title: Coercion between graph classes
### Aliases: igraph diffnet_to_igraph igraph_to_diffnet

### ** Examples

# Reading the meddical innovation data into igraph --------------------------
x <- diffnet_to_igraph(medInnovationsDiffNet)

# Fetching the times of adoption
igraph::vertex_attr(x[[1]], "toa")



