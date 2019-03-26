library(BIOM.utils)


### Name: Matrix Manipulations for BIOM Format
### Title: Convert matrix data between dense, sparse, and list
###   representations
### Aliases: sparse2dense dense2sparse matrix2list

### ** Examples

xx <- smat
xx[,1:2] <- xx[,1:2] + 1
sparse2dense (xx)
sparse2dense (xx, c(266,10))

matrix2list (dmat)
matrix2list (t(dmat))



