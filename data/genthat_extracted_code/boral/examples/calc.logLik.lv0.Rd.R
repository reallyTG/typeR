library(boral)


### Name: calc.logLik.lv0
### Title: Log-likelihood for a boral model with no latent variables
### Aliases: calc.logLik.lv0

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
##D ## Example 1 - NULL model with site effects only
##D spiderfit_nb <- boral(y, family = "negative.binomial", row.eff = "fixed", 
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
##D 
##D ## Calculate the log-likelihood at the posterior median
##D calc.logLik.lv0(y, family = "negative.binomial",
##D     lv.coefs =  coef_mat, row.eff = "fixed", row.params = site_coef)
##D 
##D 
##D ## Example 2 - Model with environmental covariates and random row effects
##D X <- scale(spider$x)
##D spiderfit_nb2 <- boral(y, X = X, family = "negative.binomial", row.eff = "random",
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
##D site.sigma <- list(ID1 = 
##D     median(fit_mcmc[,grep("row.sigma.ID1", mcmc_names)]))
##D 
##D 	
##D ## Calculate the log-likelihood at the posterior median
##D calc.logLik.lv0(y, X = spider$x, family = "negative.binomial", 
##D     row.eff = "random",lv.coefs =  coef_mat, X.coefs = X_coef_mat, 
##D     row.params = site.sigma)
## End(Not run)



