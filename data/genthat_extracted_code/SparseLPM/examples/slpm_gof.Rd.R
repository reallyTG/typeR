library(SparseLPM)


### Name: slpm_gof
### Title: slpm_gof
### Aliases: slpm_gof

### ** Examples

set.seed(12345)
M <- N <- 10
K <- 2
fitted_var_pars <- list()
fitted_var_pars$alpha_u_tilde = matrix(rnorm(M*K),M,K)
fitted_var_pars$alpha_v_tilde = matrix(rnorm(N*K),N,K)
fitted_var_pars$lambda_tilde = array(NA,c(M,N,K))
fitted_var_pars$lambda_tilde[,,1] = matrix(runif(M*N),M,N)
fitted_var_pars$lambda_tilde[,,2] = 1-fitted_var_pars$lambda_tilde[,,1]
expected_adj <- slpm_gof(fitted_var_pars)



