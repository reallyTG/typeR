library(rerf)


### Name: RandMatBinary
### Title: Create a Random Matrix: Binary
### Aliases: RandMatBinary

### ** Examples


p <- 8
d <- 3
sparsity <- 0.25
prob <- 0.5
set.seed(4)
(a <- RandMatBinary(p, d, sparsity, prob))



