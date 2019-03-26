library(BlockCov)


### Name: slope_change
### Title: This function fits to a numerical vector sorted in the non
###   decreasing order two simple linear regressions and returns the index
###   corresponding to the estimated change between the two regression
###   models.
### Aliases: slope_change

### ** Examples

n <- 30
q <- 100
Sigma <- Simu_Sigma(q = q, diag = FALSE, equal = TRUE)
Matrix::image(Sigma)
E <- matrix(rnorm(n * q), ncol = q) %*% chol(as.matrix(Sigma))
corE <- cor(as.matrix(E))
vec_up_emp <- corE[upper.tri(corE)]
Pti_sig <- matrix(0, ncol = (q - 1), nrow = (q - 1))
Pti_sig[upper.tri(Pti_sig, diag=TRUE)] <- vec_up_emp
Pti_sig[lower.tri(Pti_sig)] <- t(as.matrix(Pti_sig))[lower.tri(t(as.matrix(Pti_sig)))]
res_svd <- svd(Pti_sig)
vp      <- res_svd$d
slope_change(vp)



