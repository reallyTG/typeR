library(boral)


### Name: calc.condlogLik
### Title: Conditional log-likelihood for a boral model
### Aliases: calc.condlogLik

### ** Examples

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D      n.thin = 1)
##D 
##D library(mvabund) ## Load a dataset from the mvabund package
##D data(spider)
##D y <- spider$abun
##D n <- nrow(y)
##D p <- ncol(y)
##D 
##D ## Example 1 - model with 2 latent variables, site effects, 
##D ## 	and no environmental covariates
##D spiderfit_nb <- boral(y, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2), row.eff = "fixed", 
##D     save.model = TRUE, mcmc.control = example_mcmc_control)
##D 
##D ## Extract all MCMC samples
##D fit_mcmc <- get.mcmcsamples(spiderfit_nb) 
##D mcmc_names <- colnames(fit_mcmc)
##D 
##D ## Find the posterior medians
##D coef_mat <- matrix(apply(fit_mcmc[,grep("lv.coefs",mcmc_names)],
##D     2,median),nrow=p)
##D site_coef <- list(ID1 = apply(fit_mcmc[,grep("row.coefs.ID1", mcmc_names)],
##D     2,median))
##D lvs_mat <- matrix(apply(fit_mcmc[,grep("lvs",mcmc_names)],2,median),nrow=n)
##D 
##D ## Calculate the conditional log-likelihood at the posterior median
##D calc.condlogLik(y, family = "negative.binomial", 
##D     lv.coefs = coef_mat, row.coefs = site_coef, lv = lvs_mat)
##D 
##D 
##D ## Example 2 - model with no latent variables and environmental covariates
##D X <- scale(spider$x)
##D spiderfit_nb2 <- boral(y, X = X, family = "negative.binomial", 
##D     save.model = TRUE, mcmc.control = example_mcmc_control)
##D 
##D ## Extract all MCMC samples
##D fit_mcmc <- get.mcmcsamples(spiderfit_nb2) 
##D mcmc_names <- colnames(fit_mcmc)
##D 
##D ## Find the posterior medians
##D coef_mat <- matrix(apply(fit_mcmc[,grep("lv.coefs",mcmc_names)],
##D     2,median),nrow=p)
##D X_coef_mat <- matrix(apply(fit_mcmc[,grep("X.coefs",mcmc_names)],
##D     2,median),nrow=p)
##D 
##D ## Calculate the log-likelihood at the posterior median
##D calc.condlogLik(y, X = X, family = "negative.binomial", 
##D     lv.coefs =  coef_mat, X.coefs = X_coef_mat)
## End(Not run)



