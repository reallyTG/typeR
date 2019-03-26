library(textTinyR)


### Name: sparse_Means
### Title: RowMens and colMeans for a sparse matrix
### Aliases: sparse_Means

### ** Examples


library(textTinyR)

tmp = matrix(sample(0:1, 100, replace = TRUE), 10, 10)

sp_mat = dense_2sparse(tmp)

spsm = sparse_Means(sp_mat, rowMeans = FALSE)



