library(boral)


### Name: get.more.measures
### Title: Additional Information Criteria for boral models
### Aliases: get.more.measures

### ** Examples

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D     n.thin = 1)
##D      
##D library(mvabund) ## Load a dataset from the mvabund package
##D data(spider)
##D y <- spider$abun
##D n <- nrow(y)
##D p <- ncol(y)
##D 
##D spiderfit_nb <- boral(y, family = "negative.binomial", lv.control = list(num.lv = 2),
##D     row.eff = "fixed", save.model = TRUE, calc.ics = TRUE,
##D     mcmc.control = example_mcmc_control)
##D 
##D ## Extract MCMC samples
##D fit_mcmc <- get.mcmcsamples(spiderfit_nb)
##D 
##D ## WATCH OUT! The following takes a very long time to run!
##D get.more.measures(y, family = "negative.binomial", 
##D     num.lv = spiderfit_nb$num.lv, fit.mcmc = fit_mcmc, 
##D     row.eff = "fixed", row.ids = spiderfit_nb$row.ids)		
##D 
##D      
##D ## Illustrating what happens in a case where these criteria will 
##D ## 	not be calculated.
##D data(antTraits)
##D y <- antTraits$abun
##D X <- as.matrix(scale(antTraits$env))
##D ## Include only traits 1, 2, and 5
##D traits <- as.matrix(antTraits$traits[,c(1,2,5)])
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits))
##D     example_which_traits[[i]] <- 1:ncol(traits)
##D 
##D fit_traits <- boral(y, X = X, traits = traits, lv.control = list(num.lv = 2), 
##D     which.traits = example_which_traits, family = "negative.binomial", 
##D     save.model = TRUE, mcmc.control = example_mcmc_control)
##D      
##D ## Extract MCMC samples
##D fit_mcmc <- get.mcmcsamples(fit_traits)
##D 
##D get.more.measures(y, X = X, family = "negative.binomial", 
##D     num.lv = fit.traits$num.lv, fit.mcmc = fit_mcmc)	
## End(Not run)



