library(tensr)


### Name: anorm_cd
### Title: Array normal conditional distributions.
### Aliases: anorm_cd
### Keywords: multivariate

### ** Examples

p <- c(4, 4, 4)
Y <- array(stats::rnorm(prod(p)), dim = p)
saidx <- list(1:2, 1:2, 1:2)
true_cov <- tensr::start_ident(p)
true_mean <- array(0, dim = p)
cond_params <- anorm_cd(Y = Y, M = true_mean, S = true_cov, saidx = saidx)

## Since data are independent standard normals, conditional mean is 0 and
##    conditional covariance matrices are identities.
cond_params$Mab
cond_params$Sab



