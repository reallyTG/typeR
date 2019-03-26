library(cpr)


### Name: build_tensor
### Title: Build Tensor
### Aliases: build_tensor

### ** Examples

# see vignette("cpr-pkg", package = "cpr") for details on tensor products.

A <- matrix(1:4, nrow = 10, ncol = 20)
B <- matrix(1:6, nrow = 10, ncol = 6)

# Two ways of building the same tensor product
tensor1 <- build_tensor(A, B) 
tensor2 <- build_tensor(list(A, B))
all.equal(tensor1, tensor2)

# a three matrix tensor product
tensor3 <- build_tensor(A, B, B)
str(tensor3)



