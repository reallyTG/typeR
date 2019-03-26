library(coop)


### Name: sparsity
### Title: Sparsity
### Aliases: sparsity

### ** Examples

## Completely sparse matrix
x <- matrix(0, 10, 10)
coop::sparsity(x)

## 15% density / 85% sparsity
x[sample(length(x), size=15)] <- 1
coop::sparsity(x)




