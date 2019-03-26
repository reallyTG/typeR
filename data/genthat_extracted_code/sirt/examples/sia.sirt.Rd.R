library(sirt)


### Name: sia.sirt
### Title: Statistical Implicative Analysis (SIA)
### Aliases: sia.sirt
### Keywords: Statistical implicative analysis Graphical modeling

### ** Examples

#############################################################################
# EXAMPLE 1: SIA for data.read
#############################################################################

data(data.read)
dat <- data.read

res <- sirt::sia.sirt(dat, significance=.85 )

#*** plot results with igraph package
library(igraph)
plot( res$igraph.obj ) #, vertex.shape="rectangle", vertex.size=30 )

## Not run: 
##D #*** plot results with qgraph package
##D miceadds::library_install(qgraph)
##D qgraph::qgraph( res$adj.matrix )
##D 
##D #*** plot results with Rgraphviz package
##D # Rgraphviz can only be obtained from Bioconductor
##D # If it should be downloaded, select TRUE for the following lines
##D if (FALSE){
##D      source("http://bioconductor.org/biocLite.R")
##D      biocLite("Rgraphviz")
##D             }
##D # define graph
##D grmatrix <- res$graph.matr
##D res.graph <- new("graphNEL", nodes=res$graph.edges, edgemode="directed")
##D # add edges
##D RR <- nrow(grmatrix)
##D for (rr in 1:RR){
##D     res.graph <- Rgraphviz::addEdge(grmatrix[rr,1], grmatrix[rr,2], res.graph, 1)
##D                     }
##D # define cex sizes and shapes
##D V <- length(res$graph.edges)
##D size2 <- rep(16,V)
##D shape2 <- rep("rectangle", V )
##D names(shape2) <- names(size2) <- res$graph.edges
##D # plot graph
##D Rgraphviz::plot( res.graph, nodeAttrs=list("fontsize"=size2, "shape"=shape2) )
## End(Not run)



