library(corpustools)


### Name: set_network_attributes
### Title: Set some default network attributes for pretty plotting
### Aliases: set_network_attributes

### ** Examples

tc = create_tcorpus(c('A B C', 'B C', 'B D'))
g = tc$semnet('token')

igraph::get.edge.attribute(g)
igraph::get.vertex.attribute(g)
## Not run: plot(g)
g = set_network_attributes(g, size_attribute = 'freq')
igraph::get.edge.attribute(g)
igraph::get.vertex.attribute(g)
## Not run: plot(g)



