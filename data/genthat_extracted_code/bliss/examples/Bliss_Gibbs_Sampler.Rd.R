library(bliss)


### Name: Bliss_Gibbs_Sampler
### Title: Bliss_Gibbs_Sampler
### Aliases: Bliss_Gibbs_Sampler

### ** Examples

## No test: 
# May take a while
param_sim <- list(Q=1,n=25,p=50,grids_lim=list(c(0,1)),iter=1e4,K=2)
data_sim <- sim(param_sim,verbose=FALSE)
res_Bliss_Gibbs_Sampler <- Bliss_Gibbs_Sampler(data_sim,param_sim)
theta_1 <- res_Bliss_Gibbs_Sampler$trace[1,]
theta_1
# Resultat for few iterations
param_sim <- list(Q=1,n=25,p=50,grids_lim=list(c(0,1)),iter=5e2,K=2)
data_sim <- sim(param_sim,verbose=FALSE)
res_Bliss_Gibbs_Sampler <- Bliss_Gibbs_Sampler(data_sim,param_sim)
theta_1 <- res_Bliss_Gibbs_Sampler$trace[1,]
theta_1
## End(No test)



