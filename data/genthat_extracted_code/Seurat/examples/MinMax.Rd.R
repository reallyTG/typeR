library(Seurat)


### Name: MinMax
### Title: Apply a ceiling and floor to all values in a matrix
### Aliases: MinMax

### ** Examples

mat <- matrix(data = rbinom(n = 25, size = 20, prob = 0.2 ), nrow = 5)
mat
MinMax(data = mat, min = 4, max = 5)




