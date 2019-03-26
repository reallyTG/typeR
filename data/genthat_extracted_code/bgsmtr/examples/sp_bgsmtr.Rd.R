library(bgsmtr)


### Name: sp_bgsmtr
### Title: Spatial Bayesian Group Sparse Multi-Task Regression for Imaging
###   Genetics
### Aliases: sp_bgsmtr

### ** Examples

data(sp_bgsmtr_example_data)
names(sp_bgsmtr_example_data)


## Not run: 
##D 
##D # Run the example data with Gibbs sampling and compute Bayesian FDR as follow:
##D 
##D fit_mcmc = sp_bgsmtr(X = sp_bgsmtr_example_data$SNP_data,
##D Y = sp_bgsmtr_example_data$BrainMeasures, method = "MCMC",
##D A = bgsmtr_example_data$neighborhood_structure, rho = 0.8,
##D FDR_opt = TRUE, WAIC_opt = TRUE,lambdasq = 1000, iter_num = 10000.)
##D 
##D # MCMC estimation results for regression parameter W and estimated Bayesian FDR summaries
##D 
##D fit_mcmc$Gibbs_W_summaries
##D fit_mcmc$FDR_summaries
##D 
##D # The WAIC could be also obtained as:
##D 
##D fit_mcmc$WAIC
##D 
##D # Run the example data with mean field variational Bayes and compute Bayesian FDR as follow:
##D 
##D fit_mfvb = sp_bgsmtr(X = sp_bgsmtr_example_data$SNP_data,
##D Y = sp_bgsmtr_example_data$BrainMeasures, method = "MFVB",
##D A = bgsmtr_example_data$neighborhood_structure, rho = 0.8,FDR_opt = TRUE,
##D lambdasq = 1000, iter_num = 10000.)
##D 
##D # MFVB estimated results for regression parameter W and estimated Bayesian FDR summaries
##D fit_mfvb$MFVB_summaries
##D fit_mfvb$FDR_summaries
##D 
##D # The corresponding lower bound of MFVB method after convergence is obtained as:
##D fit_mfvb$lower_boud
##D 
## End(Not run)





