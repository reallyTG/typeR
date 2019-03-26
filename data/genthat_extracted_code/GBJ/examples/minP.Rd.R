library(GBJ)


### Name: minP
### Title: minP.R
### Aliases: minP

### ** Examples

# Should return statistic = 0.05918928 and p_value = 0.2525972.
set.seed(100)
Z_vec <- rnorm(5) + rep(1,5)
cor_Z <- matrix(data=0.2, nrow=5, ncol=5)
diag(cor_Z) <- 1
minP(test_stats=Z_vec, cor_mat=cor_Z)



