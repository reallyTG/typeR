library(brms)


### Name: stanvar
### Title: User-defined variables passed to Stan
### Aliases: stanvar stanvars

### ** Examples

bprior <- prior(normal(mean_intercept, 10), class = "Intercept")
stanvars <- stanvar(5, name = "mean_intercept")
make_stancode(count ~ Trt, epilepsy, prior = bprior, 
              stanvars = stanvars)
              
# define a multi-normal prior with known covariance matrix
bprior <- prior(multi_normal(M, V), class = "b")
stanvars <- stanvar(rep(0, 2), "M", scode = "  vector[K] M;") +
  stanvar(diag(2), "V", scode = "  matrix[K, K] V;") 
make_stancode(count ~ Trt + log_Base4_c, epilepsy,
              prior = bprior, stanvars = stanvars)
              
# define a hierachical prior on the regression coefficients
bprior <- set_prior("normal(0, tau)", class = "b") +
  set_prior("target += normal_lpdf(tau | 0, 10)", check = FALSE)
stanvars <- stanvar(scode = "real<lower=0> tau;", 
                    block = "parameters")
make_stancode(count ~ Trt + log_Base4_c, epilepsy,
              prior = bprior, stanvars = stanvars)




