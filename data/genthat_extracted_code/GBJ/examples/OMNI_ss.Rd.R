library(GBJ)


### Name: OMNI_ss
### Title: omni_ss.R
### Aliases: OMNI_ss

### ** Examples

cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
diag(cor_mat) <- 1
test_stats <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))
OMNI_ss(test_stats=test_stats, cor_mat=cor_mat, num_boots=5)



