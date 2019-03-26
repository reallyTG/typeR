library(textTinyR)


### Name: matrix_sparsity
### Title: sparsity percentage of a sparse matrix
### Aliases: matrix_sparsity

### ** Examples


library(textTinyR)

tmp = matrix(sample(0:1, 100, replace = TRUE), 10, 10)

sp_mat = dense_2sparse(tmp)

dbl = matrix_sparsity(sp_mat)



