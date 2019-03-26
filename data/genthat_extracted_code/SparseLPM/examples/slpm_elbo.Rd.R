library(SparseLPM)


### Name: slpm_elbo
### Title: slpm_elbo
### Aliases: slpm_elbo

### ** Examples

set.seed(12345)
M <- N <- 10
K <- 2
network <- slpm_gen(M = M, N = N, K = K)
var_pars <- slpm_init(X = network$adj, K = K)
hyper_pars <- list(delta = rep(1,K), a_gamma = rep(1,K), b_gamma = rep(1,K))
slpm_elbo(X = network$adj, var_pars = var_pars, hyper_pars = hyper_pars, verbose = FALSE)



