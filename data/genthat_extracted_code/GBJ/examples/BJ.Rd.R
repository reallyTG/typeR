library(GBJ)


### Name: BJ
### Title: BJ.R
### Aliases: BJ

### ** Examples

# Should return statistic = 1.243353 and p_value = 0.256618
set.seed(100)
Z_vec <- rnorm(5) + rep(1,5)
cor_Z <- matrix(data=0.2, nrow=5, ncol=5)
diag(cor_Z) <- 1
BJ(test_stats=Z_vec, cor_mat=cor_Z)



