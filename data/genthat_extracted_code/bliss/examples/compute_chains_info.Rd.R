library(bliss)


### Name: compute_chains_info
### Title: compute_chains_info
### Aliases: compute_chains_info

### ** Examples

## No test: 
param_sim <- list(Q=1,
                  n=100,
                  p=c(50),
                  grids_lim=list(c(0,1)))
data <- sim(param_sim,verbose=TRUE)

param <- list(iter=5e2,
              K=c(3),
              n_chains = 3)
res_bliss <- fit_Bliss(data,param,verbose=TRUE,compute_density=FALSE,sann=FALSE)

param$grids <- data$grids
chains_info1 <- compute_chains_info(res_bliss$chains[[1]],param)
chains_info2 <- compute_chains_info(res_bliss$chains[[2]],param)
chains_info3 <- compute_chains_info(res_bliss$chains[[3]],param)

# Smooth estimates
ylim <- range(range(chains_info1$estimates$Smooth_estimate),
range(chains_info2$estimates$Smooth_estimate),
range(chains_info3$estimates$Smooth_estimate))
plot(data$grids[[1]],chains_info1$estimates$Smooth_estimate,type="l",ylim=ylim,
xlab="grid",ylab="")
lines(data$grids[[1]],chains_info2$estimates$Smooth_estimate,col=2)
lines(data$grids[[1]],chains_info3$estimates$Smooth_estimate,col=3)

# Autocorrelation
plot(chains_info1$autocorr_lag[,1],type="h")
## End(No test)



