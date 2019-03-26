library(psychmeta)


### Name: unmix_matrix
### Title: Estimate average within-group covariance matrices from a mixture
###   covariance matrix
### Aliases: unmix_matrix

### ** Examples

out <- unmix_matrix(sigma_mat = reshape_vec2mat(.5, order = 2),
                    mu_mat = rbind(c(0, 0), c(.5, 1)),
                    p_vec =  c(.3, .7), N = 100)

## Result of unmix_matrix:
out

## Simulated data reproduce the total parameter matrix:
dat <- NULL
for(i in 1:2){
     dat <- rbind(dat, cbind(group = i,
                             data.frame(MASS::mvrnorm(n = round(out$p_group[i] * out$N),
                                                      mu = out$means_raw[i,],
                                                      Sigma = out$cov_group_unbiased[[i]],
                                                      empirical = TRUE))))
}
cov(dat[,-1])



