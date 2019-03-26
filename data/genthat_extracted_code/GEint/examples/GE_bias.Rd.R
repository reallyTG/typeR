library(GEint)


### Name: GE_bias
### Title: GE_bias.R
### Aliases: GE_bias

### ** Examples

solutions <- GE_bias_normal_squaredmis( beta_list=as.list(runif(n=6, min=0, max=1)), 
rho_list=as.list(rep(0.3,6)), prob_G=0.3, cov_Z=1, cov_W=1)
GE_bias(beta_list=solutions$beta_list, solutions$cov_list, solutions$cov_mat_list, 
					solutions$mu_list, solutions$HOM_list)



