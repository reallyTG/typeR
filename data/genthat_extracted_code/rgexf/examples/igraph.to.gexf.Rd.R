library(rgexf)


### Name: igraph.to.gexf
### Title: Converting between 'gexf' and 'igraph' classes
### Aliases: igraph.to.gexf gexf.to.igraph
### Keywords: manip

### ** Examples

 ## Not run: 
##D  
##D   # Running demo
##D   demo(gexfigraph)
##D  
##D   # A simple graph without
##D   gexf1 <- read.gexf("http://gephi.org/datasets/LesMiserables.gexf")
##D   igraph1 <- gexf.to.igraph(gexf1)
##D   gexf2 <- igraph.to.gexf(igraph1)
##D   
##D   # A graph with attributes  
##D   gexf3 <- read.gexf("http://gexf.net/data/data.gexf")
##D   igraph2 <- gexf.to.igraph(gexf3)
##D   gexf4 <- igraph.to.gexf(igraph2)
##D  
## End(Not run)



