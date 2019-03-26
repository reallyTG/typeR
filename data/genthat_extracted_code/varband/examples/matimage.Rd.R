library(varband)


### Name: matimage
### Title: Plot the sparsity pattern of a square matrix
### Aliases: matimage

### ** Examples

set.seed(123)
p <- 50
n <- 50
phi <- 0.4
true <- varband_gen(p = p, block = 5)
matimage(true)



