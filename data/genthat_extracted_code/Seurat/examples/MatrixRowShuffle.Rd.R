library(Seurat)


### Name: MatrixRowShuffle
### Title: Independently shuffle values within each row of a matrix
### Aliases: MatrixRowShuffle

### ** Examples

mat <- matrix(data = rbinom(n = 25, size = 20, prob = 0.2 ), nrow = 5)
mat
MatrixRowShuffle(x = mat)




