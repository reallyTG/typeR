library(textTinyR)


### Name: dense_2sparse
### Title: convert a dense matrix to a sparse matrix
### Aliases: dense_2sparse

### ** Examples


library(textTinyR)

tmp = matrix(sample(0:1, 100, replace = TRUE), 10, 10)

sp_mat = dense_2sparse(tmp)



