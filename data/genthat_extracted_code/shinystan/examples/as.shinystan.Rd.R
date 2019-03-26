library(shinystan)


### Name: as.shinystan
### Title: Create and test 'shinystan' objects
### Aliases: as.shinystan is.shinystan as.shinystan,array-method
###   as.shinystan,list-method as.shinystan,mcmc.list-method
###   as.shinystan,stanfit-method as.shinystan,stanreg-method

### ** Examples

 
## Not run: 
##D sso <- as.shinystan(X, ...) # replace ... with optional arguments or omit it
##D launch_shinystan(sso)
## End(Not run)

## Not run: 
##D    
##D ########################
##D ### list of matrices ###
##D ########################
##D 
##D # Generate some fake data
##D chain1 <- cbind(beta1 = rnorm(100), beta2 = rnorm(100), sigma = rexp(100))
##D chain2 <- cbind(beta1 = rnorm(100), beta2 = rnorm(100), sigma = rexp(100))
##D sso <- as.shinystan(list(chain1, chain2))
##D launch_shinystan(sso)
##D 
##D # We can also specify some or all of the optional arguments
##D # note: in order to use param_dims we need to rename 'beta1' and 'beta2'
##D # to 'beta[1]' and 'beta[2]'
##D colnames(chain1) <- colnames(chain2) <- c(paste0("beta[",1:2,"]"), "sigma")
##D sso2 <- as.shinystan(list(chain1, chain2), 
##D                      model_name = "Example", warmup = 0, 
##D                      param_dims = list(beta = 2, sigma = 0))
##D launch_shinystan(sso2)
## End(Not run)

## Not run: 
##D ######################
##D ### stanfit object ###
##D ######################
##D library("rstan")
##D fit <- stan_demo("eight_schools")
##D sso <- as.shinystan(fit, model_name = "example")
## End(Not run)

## Not run: 
##D ######################
##D ### stanreg object ###
##D ######################
##D library("rstanarm")
##D example("example_model")
##D sso <- as.shinystan(example_model)
##D launch_shinystan(sso)
## End(Not run)




