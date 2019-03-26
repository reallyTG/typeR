library(PLMIX)


### Name: mapPLMIX
### Title: MAP estimation for a Bayesian mixture of Plackett-Luce models
### Aliases: mapPLMIX

### ** Examples


data(d_carconf)

MAP <- mapPLMIX(pi_inv=d_carconf, K=ncol(d_carconf), G=3, n_iter=400*3)
str(MAP)
MAP$P_map
MAP$W_map




