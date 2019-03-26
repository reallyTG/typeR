library(GSED)


### Name: sim_magnusson_turnbull
### Title: Simulations of trials with GSED
### Aliases: sim_magnusson_turnbull

### ** Examples

#For testing purpose only, larger number of simulations required (see in comments below)
sim_magnusson_turnbull(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), l=c(0.7962, 2.5204), 
u=c(2.7625, 2.5204), ratio_Delta_star_d1=c(1), type_outcome="binary", param_outcome=
list(matrix(c(0.4,0.4,0.4,0.6,0.6,0.6),nrow=2,ncol=3,byrow=TRUE)), n_max=1496, 
ordering=FALSE, nsim=2, seed=42)

#sim_magnusson_turnbull(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), l=c(0.7962, 2.5204), 
#u=c(2.7625, 2.5204), ratio_Delta_star_d1=c(1), type_outcome="binary", param_outcome=
#list(matrix(c(0.4,0.4,0.4,0.6,0.6,0.6),nrow=2,ncol=3,byrow=TRUE)), n_max=1496, 
#ordering=FALSE, nsim=1000, seed=42)

#sim_magnusson_turnbull(K_stages=2, N_subsets=3, f=c(0.6,0.2,0.2), l=c(0.7962, 2.5204), 
#u=c(2.7625, 2.5204), ratio_Delta_star_d1=c(1), type_outcome="binary", param_outcome=
#list(matrix(c(0.5,0.5,0.5,0.5,0.5,0.5),nrow=2,ncol=3,byrow=TRUE)), n_max=1496, 
#ordering=FALSE, nsim=1000, seed=42)

#sim_magnusson_turnbull(K_stages=2, N_subsets=4, f=c(0.25,0.25,0.25,0.25), l=c(0.98,2.35), 
#u=c(2.59,2.35), ratio_Delta_star_d1=c(1), type_outcome="survival", incl_rate=1/28, 
#mean_cur_c=7/log(2), HR=c(0.8,0.8,0.8,0.8), nb_required=1030, ordering=TRUE, 
#increasing_theta=FALSE, nsim=1000, seed=42)



