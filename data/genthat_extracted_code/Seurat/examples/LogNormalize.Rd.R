library(Seurat)


### Name: LogNormalize
### Title: Normalize raw data
### Aliases: LogNormalize

### ** Examples

mat <- matrix(data = rbinom(n = 25, size = 5, prob = 0.2), nrow = 5)
mat
mat_norm <- LogNormalize(data = mat)
mat_norm




