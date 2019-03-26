library(evolqg)


### Name: ExtendMatrix
### Title: Control Inverse matrix noise with Extension
### Aliases: ExtendMatrix
### Keywords: covariancematrix extension

### ** Examples

cov.matrix = RandomMatrix(11, 1, 1, 100)
ext.matrix = ExtendMatrix(cov.matrix, var.cut.off = 1e-6)
ext.matrix = ExtendMatrix(cov.matrix, ret.dim = 6)



