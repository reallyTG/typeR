library(boral)


### Name: about.traits
### Title: Including species traits in boral
### Aliases: about.traits

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
##D for(i in 1:length(ssvs_traitsindex)) ssvs_traitsindex[[i]] <- rep(0,ncol(traits))
##D ssvs_traitsindex[[3]] <- -1
##D fit_traits <- boral(y, X = X, traits = traits, which.traits = example_which_traits, 
##D     family = "negative.binomial", mcmc.control = example_mcmc_control, 
##D     save.model = TRUE, prior.control = list(ssvs.traitsindex = ssvs_traitsindex))
##D 
##D summary(fit_traits)
##D 
##D 
##D ## Example 6 - simulate Bernoulli data, based on a model with two latent variables, 
##D ## no site variables, with two traits and one environmental covariates 
##D ## This example is a proof of concept that traits can used to 
##D ## explain environmental responses 
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
##D     lv.coefs = cbind(rnorm(s), rmvnorm(s, mean = rep(0,2))), 
##D     traits.coefs = matrix(c(0.1,1,-0.5,1,0.5,0,-1,1), 2, byrow = TRUE))
##D rownames(simfit$traits.coefs) <- c("beta0","elevation")
##D colnames(simfit$traits.coefs) <- c("kappa0","thorns-dummy","SLA","sigma")
##D 
##D simy = create.life(true.lv = simfit$true.lv, lv.coefs = simfit$lv.coefs, X = X, 
##D     traits = traits, traits.coefs = simfit$traits.coefs, family = "binomial") 
##D 
##D 
##D example_which_traits <- vector("list",ncol(X)+1)
##D for(i in 1:length(example_which_traits)) 
##D      example_which_traits[[i]] <- 1:ncol(traits)
##D fit_traits <- boral(y = simy, X = X, traits = traits, 
##D     which.traits = example_which_traits, family = "binomial", 
##D     lv.control = list(num.lv = 2), save.model = TRUE, 
##D     mcmc.control = example_mcmc_control)	
## End(Not run)




