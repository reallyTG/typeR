library(GEint)


### Name: GE_bias_old
### Title: GE_bias_old.R
### Aliases: GE_bias_old

### ** Examples

solutions <- GE_bias_normal_squaredmis_old( beta_list=as.list(runif(n=6, min=0, max=1)), 
						rho_list=as.list(rep(0.3,6)), prob_G=0.3)
GE_bias_old(beta_list=solutions$beta_list, solutions$cov_list, solutions$cov_mat_list, 
					solutions$mu_list, solutions$HOM_list)



