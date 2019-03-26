library(netdiffuseR)


### Name: as_dgCMatrix
### Title: Coerce a matrix-like objects to 'dgCMatrix' (sparse matrix)
### Aliases: as_dgCMatrix as.dgCMatrix as_spmat as_dgCMatrix.default
###   as_dgCMatrix.diffnet as_dgCMatrix.array as_dgCMatrix.igraph
###   as_dgCMatrix.network as_dgCMatrix.list

### ** Examples


set.seed(1231)
x <- rgraph_er(10)

# From matrix object
as_dgCMatrix(as.matrix(x))

# From a network object
as_dgCMatrix(network::as.network(as.matrix(x)))

# From igraph object
as_dgCMatrix(igraph::graph_from_adjacency_matrix(x))

# From array
myarray <- array(dim=c(10,10,2))
myarray[,,1] <- as.matrix(x)
myarray[,,2] <- as.matrix(x)

myarray
as_dgCMatrix(myarray)

# From a diffnet object
ans <- as_dgCMatrix(medInnovationsDiffNet)
str(ans)





