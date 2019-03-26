library(SparseLPM)


### Name: slpm_init
### Title: slpm_init
### Aliases: slpm_init

### ** Examples

set.seed(12345)
M <- N <- 10
K <- 2
network <- slpm_gen(M = M, N = N, K = K)
var_pars_init <- slpm_init(X = network$adj, K = K)



