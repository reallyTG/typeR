library(boral)


### Name: predict.boral
### Title: Predict using a boral model
### Aliases: predict.boral

### ** Examples

## Not run: 
##D library(mvabund) ## Load a dataset from the mvabund package
##D library(mvtnorm) 
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
##D ## Example 1 - model with two latent variables, random site effects, 
##D ## 	and environmental covariates
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D     row.eff = "random", lv.control = list(num.lv = 2), 
##D     mcmc.control = example_mcmc_control, save.model = TRUE)
##D 
##D 
##D ## Predictions conditional on predicted latent variables
##D getcondpreds <- predict(spiderfit_nb)
##D 
##D ## Predictions marginal on latent variables, random row effects
##D ## The intervals for these will generally be wider than the
##D ##   conditional intervals.
##D getmargpreds <- predict(spiderfit_nb, predict.type = "marginal")
##D 
##D 
##D ## Now suppose you extrpolate to new sites
##D newX <- rmvnorm(100, mean = rep(0,ncol(X)))
##D 
##D ## Below won't work since conditional predictions are made to the same sites
##D getcondpreds <- predict(spiderfit_nb, newX = newX)
##D 
##D ## Marginal predictions will work though provided newrow.ids is set up 
##D ## properly. For example,
##D new_row_ids <- matrix(sample(1:28,100,replace=TRUE), 100, 1)
##D getmargpreds <- predict(spiderfit_nb, newX = newX, predict.type = "marginal", 
##D      newrow.ids = new_row_ids)
##D 
##D      
##D ## Example 1b - Similar to 1a except with no random site effects, 
##D ## 	and a non-independence correlation structure for the latent variables
##D ##      based on a fake distance matrix
##D fakedistmat <- as.matrix(distmat(1:n))
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D      lv.control = list(type = "squared.exponential", num.lv = 2, distmat = fakedistmat),
##D      mcmc.control = example_mcmc_control, save.model = TRUE)
##D 
##D getmargpreds <- predict(spiderfit_nb, predict.type = "marginal", distmat = fakedistmat)
##D 
##D ## Now suppose you extrpolate to new sites
##D newfakedistmat <- as.matrix(distmat(1:100))
##D 
##D getmargpreds <- predict(spiderfit_nb, newX = newX, predict.type = "marginal", 
##D      distmat = newfakedistmat)
##D 
##D      
##D      
##D ## Example 2 - simulate count data, based on a model with two latent variables, 
##D ## no site variables, with two traits and one environmental covariates 
##D library(mvtnorm)
##D 
##D n <- 100; s <- 50
##D X <- as.matrix(scale(1:n))
##D colnames(X) <- c("elevation")
##D 
##D traits <- cbind(rbinom(s,1,0.5), rnorm(s)) 
##D ## one categorical and one continuous variable
##D colnames(traits) <- c("thorns-dummy","SLA")
##D 
##D simfit <- list(true.lv = rmvnorm(n, mean = rep(0,2)), 
##D 	lv.coefs = cbind(rnorm(s), rmvnorm(s, mean = rep(0,2)), 1), 
##D 	traits.coefs = matrix(c(0.1,1,-0.5,0.1,0.5,0,-1,0.1), 2, byrow = TRUE))
##D rownames(simfit$traits.coefs) <- c("beta0","elevation")
##D colnames(simfit$traits.coefs) <- c("kappa0","thorns-dummy","SLA","sigma")
##D 
##D simy = create.life(true.lv = simfit$true.lv, lv.coefs = simfit$lv.coefs, X = X, 
##D 	traits = traits, traits.coefs = simfit$traits.coefs, family = "normal") 
##D 
##D 
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits)) 
##D      example_which_traits[[i]] <- 1:ncol(traits)
##D fit_traits <- boral(y = simy, X = X, traits = traits, 
##D      which.traits = example_which_traits, family = "normal", 
##D      lv.control = list(num.lv = 2), save.model = TRUE, 
##D      mcmc.control = example_mcmc_control)	
##D 
##D      
##D ## Predictions conditional on predicted latent variables   
##D getcondpreds <- predict(fit_traits)     
##D      
##D ## Predictions marginal on latent variables
##D ## The intervals for these will generally be wider than the
##D ##   conditional intervals.
##D getmargpreds <- predict(fit_traits, predict.type = "marginal")
## End(Not run)




