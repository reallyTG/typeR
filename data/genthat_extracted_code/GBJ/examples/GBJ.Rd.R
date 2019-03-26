library(GBJ)


### Name: GBJ
### Title: GBJ.R
### Aliases: GBJ

### ** Examples

# Should return statistic = 0.9248399 and p_value = 0.2670707
set.seed(100)
Z_vec <- rnorm(5) + rep(1,5)
cor_Z <- matrix(data=0.2, nrow=5, ncol=5)
diag(cor_Z) <- 1
GBJ(test_stats=Z_vec, cor_mat=cor_Z)



