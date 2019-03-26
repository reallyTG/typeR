library(sparsebnUtils)


### Name: to_bn
### Title: Conversion between graph types
### Aliases: to_bn to_graphNEL to_igraph to_network sparsebn-compat

### ** Examples

## Not run: 
##D ### Learn the cytometry network
##D library(sparsebn)
##D data(cytometryContinuous)
##D cyto.data <- sparsebnData(cytometryContinuous[["data"]],
##D                           type = "continuous",
##D                           ivn = cytometryContinuous[["ivn"]])
##D cyto.learn <- estimate.dag(data = cyto.data)
##D 
##D ### The output is a sparsebnPath object, which is a list of sparsebnFit objects
##D class(cyto.learn)
##D class(cyto.learn[[1]])
##D 
##D ### Convert to igraph
##D cyto.igraph <- to_igraph(cyto.learn)
##D class(cyto.igraph)       # not an igraph object!
##D class(cyto.igraph[[1]]$edges) # the graph data in the 'edges' slot is converted to igraph
##D gr <- cyto.igraph[[1]]$edges
##D 
##D ### Different behaviour when input is already an edgeList
##D edgeL <- cyto.learn[[1]]$edges
##D gr <- to_igraph(edgeL) # input is edgeList, not sparsebnFit or sparsebnPath
##D class(gr)              # igraph object
## End(Not run)




