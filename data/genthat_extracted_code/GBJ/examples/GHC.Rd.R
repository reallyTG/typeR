library(GBJ)


### Name: GHC
### Title: GHC.R
### Aliases: GHC

### ** Examples

set.seed(100)
Z_vec <- rnorm(5)
cor_Z <- matrix(data=0.2, nrow=5, ncol=5)
diag(cor_Z) <- 1
GHC(test_stats=Z_vec, cor_mat=cor_Z)



