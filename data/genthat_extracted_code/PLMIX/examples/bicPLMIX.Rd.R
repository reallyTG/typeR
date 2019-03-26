library(PLMIX)


### Name: bicPLMIX
### Title: BIC for a mixture of Plackett-Luce models
### Aliases: bicPLMIX

### ** Examples


data(d_carconf)
K <- ncol(d_carconf)
MAP_mult <- mapPLMIX_multistart(pi_inv=d_carconf, K=K, G=3, n_start=2, n_iter=400*3)
bicPLMIX(max_log_lik=MAP_mult$mod$max_objective, pi_inv=d_carconf, G=3)$bic

# Equivalently,
MAP_mult$mod$bic




