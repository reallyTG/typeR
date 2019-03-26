library(GSED)


### Name: max_FI
### Title: Maximum Fisher information
### Aliases: max_FI

### ** Examples

theta_assumption = list(matrix(c(0.4,0.6,0.4,0.6,0.4,0.6),nrow=2,ncol=3))

#For testing purpose only, larger number of simulations required (see in comments below)
max_FI(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), ratio_Delta_star_d1=c(1), l=c(0.7962, 2.5204), 
u=c(2.7625, 2.5204), type_outcome="binary", param_theta=theta_assumption, pow=0.9, 
ordering=FALSE, increasing_theta=FALSE, seed=140691, n_trials=3, rule=1)
       
#max_FI(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), ratio_Delta_star_d1=c(1), l=c(0.7962, 2.5204), 
#u=c(2.7625, 2.5204), type_outcome="binary", param_theta=theta_assumption, pow=0.9, 
#ordering=FALSE, increasing_theta=FALSE, seed=140691, n_trials=10000000, rule=1)

#max_FI(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), ratio_Delta_star_d1=c(1), l=c(0.7962, 2.5204), 
#u=c(2.7625, 2.5204), type_outcome="binary", param_theta=theta_assumption, pow=0.9,
#ordering=FALSE, increasing_theta=FALSE, seed=140691, n_trials=10000000, rule=2)



