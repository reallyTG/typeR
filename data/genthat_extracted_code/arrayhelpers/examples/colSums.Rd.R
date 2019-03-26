library(arrayhelpers)


### Name: colSums,matrix-method
### Title: Row and column sums and means for numeric arrays.
### Aliases: colMeans,array-method colMeans,matrix-method colMeans.AsIs
###   colSums,array-method colSums,matrix-method colSums.AsIs
###   rowMeans,array-method rowMeans,matrix-method rowMeans.AsIs
###   rowSums,array-method rowSums,matrix-method rowSums.AsIs
### Keywords: algebra arith array

### ** Examples

a <- array (1 : 24, 4 : 2)
a

rowSums (a)
rowSums (a, drop = FALSE)

colSums (a)
colSums (a, drop = FALSE)

colSums (a, dim = 2)
colSums (a, dim = 2, drop = FALSE)




