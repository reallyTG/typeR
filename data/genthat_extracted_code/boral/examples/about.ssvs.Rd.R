library(boral)


### Name: about.ssvs
### Title: Stochastic search variable selection (SSVS) in boral
### Aliases: about.ssvs

### ** Examples

library(mvabund) ## Load a dataset from the mvabund package
data(spider)
y <- spider$abun
X <- scale(spider$x)
n <- nrow(y)
p <- ncol(y)

## NOTE: The two examples below and taken directly from the boral help file

example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
     n.thin = 1)

## Not run: 
##D ## Example 3a - Extend example 2 to demonstrate grouped covariate selection
##D ## on the last three covariates. 
##D example_prior_control <- list(type = c("normal","normal","normal","uniform"), 
##D      ssvs.index = c(-1,-1,-1,1,2,3))
##D spiderfit_nb2 <- boral(y, X = X, family = "negative.binomial", 
##D     mcmc.control = example_mcmc_control, prior.control = example_prior_control)
##D      
##D summary(spiderfit_nb2) 
##D 
##D 
##D ## Example 3b - Extend example 2 to demonstrate individual covariate selection
##D ## on the last three covariates. 
##D example_prior_control <- list(type = c("normal","normal","normal","uniform"), 
##D      ssvs.index = c(-1,-1,-1,0,0,0))
##D spiderfit_nb3 <- boral(y, X = X, family = "negative.binomial", 
##D     mcmc.control = example_mcmc_control, prior.control = example_prior_control)
##D summary(spiderfit_nb3) 
##D 
##D 
##D ## Example 5a - model fitted to count data, no site effects, and
##D ## two latent variables, plus traits included to explain environmental responses
##D data(antTraits)
##D y <- antTraits$abun
##D X <- as.matrix(scale(antTraits$env))
##D ## Include only traits 1, 2, and 5
##D traits <- as.matrix(antTraits$traits[,c(1,2,5)])
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits)) 
##D      example_which_traits[[i]] <- 1:ncol(traits)
##D ## Just for fun, the regression coefficients for the second column of X,
##D ## corresponding to the third element in the list example_which_traits,
##D ## will be estimated separately and not regressed against traits.
##D example_which_traits[[3]] <- 0
##D 
##D fit_traits <- boral(y, X = X, traits = traits, 
##D     which.traits = example_which_traits, family = "negative.binomial", 
##D     mcmc.control = example_mcmc_control, save.model = TRUE)
##D 
##D summary(fit_traits)
##D 
##D 
##D ## Example 5b - perform selection on trait coefficients
##D ssvs_traitsindex <- vector("list",ncol(X)+1)
##D for(i in 1:length(ssvs_traitsindex)) 
##D      ssvs_traitsindex[[i]] <- rep(0,ncol(traits))
##D ssvs_traitsindex[[3]] <- -1
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", mcmc.control = example_mcmc_control, 
##D     save.model = TRUE, prior.control = list(ssvs.traitsindex = ssvs_traitsindex))
##D 
##D summary(fit_traits)
## End(Not run)




