library(PLMIX)


### Name: mapPLMIX_multistart
### Title: MAP estimation for a Bayesian mixture of Plackett-Luce models
###   with multiple starting values
### Aliases: mapPLMIX_multistart

### ** Examples


require(MCMCpack)

data(d_carconf)

MAP_mult <- mapPLMIX_multistart(pi_inv=d_carconf, K=ncol(d_carconf), G=3, 
                                            n_start=2, n_iter=400*3)
str(MAP_mult)
MAP_mult$mod$P_map
MAP_mult$mod$W_map




