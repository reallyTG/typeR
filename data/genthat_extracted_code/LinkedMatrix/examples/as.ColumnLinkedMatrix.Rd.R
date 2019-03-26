library(LinkedMatrix)


### Name: as.ColumnLinkedMatrix
### Title: Converts an Object to a LinkedMatrix Object.
### Aliases: as.ColumnLinkedMatrix as.ColumnLinkedMatrix.list
###   as.RowLinkedMatrix as.RowLinkedMatrix.list

### ** Examples

m1 <- ff::ff(initdata = rnorm(50), dim = c(5, 10))
m2 <- bigmemory::big.matrix(init = rnorm(50), nrow = 5, ncol = 10)
m3 <- matrix(data = rnorm(50), nrow = 5, ncol = 10)

myList <- list(m1, m2, m3)

m <- as.ColumnLinkedMatrix(myList)



