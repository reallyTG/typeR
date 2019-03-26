library(GSED)


### Name: boundaries_sim
### Title: Lower and upper boundaries for GSED
### Aliases: boundaries_sim

### ** Examples

#For testing purpose only, larger number of simulations required (see in comments below)
boundaries_sim(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), ratio_Delta_star_d1=c(1), 
ordering=FALSE, seed=42, n_trials=3, alpha_spending=c(0,0.0125,0.025), 
one_minus_alpha_spending=c(0,0.4875,0.975))

#boundaries_sim(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), ratio_Delta_star_d1=c(1), 
#ordering=FALSE, seed=42, n_trials=10000000, alpha_spending=c(0,0.0125,0.025), 
#one_minus_alpha_spending=c(0,0.4875,0.975))



