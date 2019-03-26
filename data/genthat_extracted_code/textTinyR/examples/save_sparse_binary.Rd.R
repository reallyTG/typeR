library(textTinyR)


### Name: save_sparse_binary
### Title: save a sparse matrix in binary format
### Aliases: save_sparse_binary

### ** Examples


library(textTinyR)

tmp = matrix(sample(0:1, 100, replace = TRUE), 10, 10)

sp_mat = dense_2sparse(tmp)

# save_sparse_binary(sp_mat, file_name = "save_sparse.mat")



