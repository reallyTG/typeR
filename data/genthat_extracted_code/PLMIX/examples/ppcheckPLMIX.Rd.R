library(PLMIX)


### Name: ppcheckPLMIX
### Title: Posterior predictive check for Bayesian mixtures of
###   Plackett-Luce models
### Aliases: ppcheckPLMIX

### ** Examples


data(d_carconf)

K <- ncol(d_carconf)
n.start <- 2

MAP_1 <- mapPLMIX_multistart(pi_inv=d_carconf, K=K, G=1, 
                             n_start=n.start, n_iter=400*1)

MAP_2 <- mapPLMIX_multistart(pi_inv=d_carconf, K=K, G=2, 
                             n_start=n.start, n_iter=400*2)
                                   
MAP_3 <- mapPLMIX_multistart(pi_inv=d_carconf, K=K, G=3, 
                             n_start=n.start, n_iter=400*3)
                                   
mcmc_iter <- 30
burnin <- 10

GIBBS_1 <- gibbsPLMIX(pi_inv=d_carconf, K=K, G=1, n_iter=mcmc_iter, 
                      n_burn=burnin, init=list(p=MAP_1$mod$P_map,
                      z=binary_group_ind(MAP_1$mod$class_map,G=1)))
GIBBS_2 <- gibbsPLMIX(pi_inv=d_carconf, K=K, G=2, n_iter=mcmc_iter, 
                      n_burn=burnin, init=list(p=MAP_2$mod$P_map,
                      z=binary_group_ind(MAP_2$mod$class_map,G=2)))
GIBBS_3 <- gibbsPLMIX(pi_inv=d_carconf, K=K, G=3, n_iter=mcmc_iter, 
                      n_burn=burnin, init=list(p=MAP_3$mod$P_map,
                      z=binary_group_ind(MAP_3$mod$class_map,G=3)))
                            
CHECK <- ppcheckPLMIX(pi_inv=d_carconf, seq_G=1:3, 
                      MCMCsampleP=list(GIBBS_1$P, GIBBS_2$P, GIBBS_3$P), 
                      MCMCsampleW=list(GIBBS_1$W, GIBBS_2$W, GIBBS_3$W))
CHECK$post_pred_pvalue




