library(plsgenomics)


### Name: matrix.heatmap
### Title: Heatmap visualization for matrix
### Aliases: matrix.heatmap

### ** Examples

### load plsgenomics library
library(plsgenomics)

### generate a matrix
A = matrix(runif(10*10), ncol=10)

### heatmap of estimated probabilities
matrix.heatmap(A)




