library(expSBM)


### Name: expSBM_EM
### Title: expSBM_EM
### Aliases: expSBM_EM

### ** Examples

set.seed(1)
data(high_school)
K <- 4
lambda_init <- rep(1/K,K)
Z_init <- expSBM_init(high_school$edgelist, K, soft = TRUE)$Z
mu_init <- nu_init <- matrix(1,K,K)
expSBM_EM(N = 327, high_school$edgelist, Z_init, lambda_init, mu_init, nu_init)



