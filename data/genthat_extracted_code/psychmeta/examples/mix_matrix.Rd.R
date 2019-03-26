library(psychmeta)


### Name: mix_matrix
### Title: Estimate mixture covariance matrix from within-group covariance
###   matrices
### Aliases: mix_matrix

### ** Examples

out <- unmix_matrix(sigma_mat = reshape_vec2mat(.5, order = 2),
                    mu_mat = rbind(c(0, 0), c(.5, 1)),
                    p_vec =  c(.3, .7), N = 100)

mix_matrix(sigma_list = out$cov_group_unbiased,
           mu_mat = out$means_raw[-3,],
           p_vec = out$p_group, N = out$N)



