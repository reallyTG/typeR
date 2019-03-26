library(GBJ)


### Name: HC
### Title: HC.R
### Aliases: HC

### ** Examples

# Should return statistic = 2.067475 and p_value = 0.2755146
set.seed(100)
Z_vec <- rnorm(5) + rep(1,5)
cor_Z <- matrix(data=0.2, nrow=5, ncol=5)
diag(cor_Z) <- 1
HC(test_stats=Z_vec, cor_mat=cor_Z)



