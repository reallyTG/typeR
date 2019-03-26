library(psychmeta)


### Name: correct_matrix_mvrr
### Title: Multivariate select/correction for covariance matrices
### Aliases: correct_matrix_mvrr

### ** Examples

Sigma_i <- reshape_vec2mat(cov = .2, var = .8, order = 4)
Sigma_xx_a <- reshape_vec2mat(cov = .5, order = 2)
correct_matrix_mvrr(Sigma_i = Sigma_i, Sigma_xx_a = Sigma_xx_a, x_col = 1:2, standardize = TRUE)



