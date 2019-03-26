library(tensr)


### Name: atrans
### Title: Tucker product.
### Aliases: atrans

### ** Examples

A <- array(1:8, dim = c(2,2,2))
B <- list()
B[[1]] <-matrix(1:4, nrow = 2)
B[[2]] <- matrix(1:6, nrow = 3)
B[[3]] <- matrix(1:2, nrow = 1)
atrans(A,B)



