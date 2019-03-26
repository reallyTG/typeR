library(textTinyR)


### Name: sparse_Sums
### Title: RowSums and colSums for a sparse matrix
### Aliases: sparse_Sums

### ** Examples


library(textTinyR)

tmp = matrix(sample(0:1, 100, replace = TRUE), 10, 10)

sp_mat = dense_2sparse(tmp)

spsm = sparse_Sums(sp_mat, rowSums = FALSE)



