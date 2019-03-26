library(LinkedMatrix)


### Name: nNodes
### Title: Returns the Number of Nodes.
### Aliases: nNodes

### ** Examples

# Create an example RowLinkedMatrix from various matrix-like objects that
# correspond in dimensions
m <- RowLinkedMatrix(
    ff::ff(initdata = rnorm(50), dim = c(5, 10)),
    bigmemory::big.matrix(init = rnorm(50), nrow = 5, ncol = 10),
    matrix(data = rnorm(50), nrow = 5, ncol = 10)
)

# Get the number of nodes of the RowLinkedMatrix
nNodes(m)



