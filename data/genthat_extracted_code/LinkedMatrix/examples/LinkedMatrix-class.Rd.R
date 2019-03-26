library(LinkedMatrix)


### Name: LinkedMatrix-class
### Title: A Class Union of ColumnLinkedMatrix and RowLinkedMatrix.
### Aliases: LinkedMatrix-class

### ** Examples

# Create an example RowLinkedMatrix from various matrix-like objects that
# correspond in dimensions
m <- RowLinkedMatrix(
    ff::ff(initdata = rnorm(50), dim = c(5, 10)),
    bigmemory::big.matrix(init = rnorm(50), nrow = 5, ncol = 10),
    matrix(data = rnorm(50), nrow = 5, ncol = 10)
)

# Test if m is an object of either type ColumnLinkedMatrix or RowLinkedMatrix
if (is(m, "LinkedMatrix")) {
    message("m is a LinkedMatrix")
}



