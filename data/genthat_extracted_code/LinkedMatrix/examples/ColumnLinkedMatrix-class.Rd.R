library(LinkedMatrix)


### Name: ColumnLinkedMatrix-class
### Title: A Class for Linking Matrices by Columns or Rows.
### Aliases: ColumnLinkedMatrix-class ColumnLinkedMatrix
###   RowLinkedMatrix-class RowLinkedMatrix

### ** Examples

# Create various matrix-like objects that correspond in dimensions
m1 <- ff::ff(initdata = rnorm(50), dim = c(5, 10))
m2 <- bigmemory::big.matrix(init = rnorm(50), nrow = 5, ncol = 10)
m3 <- matrix(data = rnorm(50), nrow = 5, ncol = 10)

# Link random matrices by columns
cm <- ColumnLinkedMatrix(m1, m2, m3)
dim(cm)

# Link random matrices by rows
rm <- RowLinkedMatrix(m1, m2, m3)
dim(rm)

# Get the number of nodes of each linked matrix
nNodes(cm)
nNodes(rm)

# Extract specific rows of linked matrix
cm[1, ]
cm[1:3, ]
rm[1, ]
rm[1:3, ]

# Extract specific columns of linked matrix
cm[, 1]
cm[, 1:3]
rm[, 1]
rm[, 1:3]

# Extract specific rows and columns of linked matrix
cm[1, 1]
cm[1:3, 1:3]
rm[1, 1]
rm[1:3, 1:3]

# Get a reference to one of the nodes
n <- cm[[2]]
class(n) == "big.matrix"

# LinkedMatrix objects are matrix-like and can be nested
rcm <- RowLinkedMatrix(cm, cm)



