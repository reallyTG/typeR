library(GEint)


### Name: GE_nleqslv_old
### Title: GE_nleqslv_old.R #' Uses package nleqslv to get a numerical
###   solution to the score equations, which we can use to check our direct
###   solution from GE_bias_old().
### Aliases: GE_nleqslv_old

### ** Examples

solutions <- GE_bias_normal_squaredmis_old( beta_list=as.list(runif(n=6, min=0, max=1)), 
						rho_list=as.list(rep(0.3,6)), prob_G=0.3)
GE_nleqslv_old(beta_list=solutions$beta_list, solutions$cov_list, solutions$cov_mat_list, 
					solutions$mu_list, solutions$HOM_list)



