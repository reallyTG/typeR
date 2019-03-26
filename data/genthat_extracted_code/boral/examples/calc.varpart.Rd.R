library(boral)


### Name: calc.varpart
### Title: Variance partitioning for a boral model
### Aliases: calc.varpart

### ** Examples

## Not run: 
##D library(mvabund) ## Load a dataset from the mvabund package
##D data(spider)
##D y <- spider$abun
##D X <- scale(spider$x)
##D n <- nrow(y)
##D p <- ncol(y)
##D 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D      n.thin = 1)
##D 
##D ## Example 1 - model with X variables, two latent variables, and no row effects
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D      lv.control = list(num.lv = 2), 
##D      save.model = TRUE, mcmc.control = example_mcmc_control)
##D 
##D ## Partition variance for each species into that explained by covariates 
##D ## and by the latent variables
##D dovar <- calc.varpart(spiderfit_nb)
##D 
##D ## Consider the intercept and first two covariates in X as one group, 
##D ## and remaining four covariates in X as another group, 
##D ## then partition variance for each species based on these groups.
##D dovar <- calc.varpart(spiderfit_nb, groupX = c(1,1,1,2,2,2,2))
##D 
##D 
##D ## Example 2 - model fitted to count data, no site effects, and
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
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", mcmc.control = example_mcmc_control, 
##D     save.model = TRUE)
##D 
##D ## Partition variance for each species due to covariates in X 
##D ## and latent variables. Also calculate proportion of variance 
##D ## due to the covariates which can be explained by traits 
##D dovar <- calc.varpart(fit_traits)
## End(Not run)




