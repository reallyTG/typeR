library(SparseLPM)


### Name: slpm_nga
### Title: slpm_nga
### Aliases: slpm_nga

### ** Examples

set.seed(12345)
network <- slpm_gen(M = 15, N = 10, K = 2)
K <- 6
var_pars_init <- slpm_init(X = network$adj, K = K)
res <- slpm_nga(X = network$adj, K = K, var_pars_init = var_pars_init)



