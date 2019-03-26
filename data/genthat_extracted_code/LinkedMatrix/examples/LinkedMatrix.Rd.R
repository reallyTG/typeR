library(LinkedMatrix)


### Name: LinkedMatrix
### Title: Create an Empty, Prespecified LinkedMatrix Object.
### Aliases: LinkedMatrix

### ** Examples

# Create an empty 15x10 RowLinkedMatrix with 3 matrix nodes
m1 <- LinkedMatrix(nrow = 15, ncol = 10, nNodes = 3, linkedBy = "rows",
                   nodeInitializer = "matrixNodeInitializer")
dim(m1)
nNodes(m1)
all(sapply(m1, class) == "matrix")

# Create an empty 15x10 RowLinkedMatrix with 3 ff nodes
m2 <- LinkedMatrix(nrow = 15, ncol = 10, nNodes = 3, linkedBy = "rows",
                   nodeInitializer = "ffNodeInitializer", vmode = "byte")
dim(m2)
nNodes(m2)
all(sapply(m2, inherits, "ff_matrix"))

# Create an empty 15x10 RowLinkedMatrix with 3 big.matrix nodes
m3 <- LinkedMatrix(nrow = 15, ncol = 10, nNodes = 3, linkedBy = "rows",
                   nodeInitializer = function(nodeIndex, nrow, ncol, ...) {
                       bigmemory::big.matrix(nrow = nrow, ncol = ncol)
                   })
dim(m3)
nNodes(m3)
all(sapply(m3, class) == "big.matrix")



