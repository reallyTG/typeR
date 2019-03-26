library(qlcMatrix)


### Name: Array
### Title: Sparse Arrays ("Tensors")
### Aliases: Array sparseArray as.Matrix

### ** Examples

x <- matrix(c(1, 0, 0, 2), nrow = 2)
s <- as.simple_triplet_matrix(x)
str(s)

as.Matrix(s)
str(as.Matrix(s))



