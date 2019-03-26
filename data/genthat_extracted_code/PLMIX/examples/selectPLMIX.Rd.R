library(PLMIX)


### Name: selectPLMIX
### Title: Bayesian selection criteria for mixtures of Plackett-Luce models
### Aliases: selectPLMIX

### ** Examples


data(d_carconf)

K <- ncol(d_carconf)
n.start <- 2

MAP_1 <- mapPLMIX_multistart(pi_inv=d_carconf, K=K, G=1, 
                                   n_start=n.start, n_iter=400*1)

MAP_2 <- mapPLMIX_multistart(pi_inv=d_carconf, K=K, G=2, 
                                   n_start=n.start, n_iter=400*2)

mcmc_iter <- 30
burnin <- 10

GIBBS_1 <- gibbsPLMIX(pi_inv=d_carconf, K=K, G=1, n_iter=mcmc_iter, 
                      n_burn=burnin, init=list(p=MAP_1$mod$P_map,
                      z=binary_group_ind(MAP_1$mod$class_map,G=1)))
GIBBS_2 <- gibbsPLMIX(pi_inv=d_carconf, K=K, G=2, n_iter=mcmc_iter, 
                      n_burn=burnin, init=list(p=MAP_2$mod$P_map,
                      z=binary_group_ind(MAP_2$mod$class_map,G=2)))

SELECT <- selectPLMIX(pi_inv=d_carconf, seq_G=1:2, 
                      MAPestP=list(MAP_1$mod$P_map, MAP_2$mod$P_map), 
                      MAPestW=list(MAP_1$mod$W_map, MAP_2$mod$W_map), 
                      deviance=list(GIBBS_1$deviance, GIBBS_2$deviance))
SELECT$criteria




