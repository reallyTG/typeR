library(greta)


### Name: inference
### Title: statistical inference on greta models
### Aliases: inference mcmc stashed_samples extra_samples initials opt

### ** Examples

## Not run: 
##D # define a simple Bayesian model
##D x <- rnorm(10)
##D mu <- normal(0, 5)
##D sigma <- lognormal(1, 0.1)
##D distribution(x) <- normal(mu, sigma)
##D m <- model(mu, sigma)
##D 
##D # carry out mcmc on the model
##D draws <- mcmc(m, n_samples = 100)
##D 
##D # add some more samples
##D draws <- extra_samples(draws, 200)
##D 
##D #' # initial values can be passed for some or all model variables
##D draws <- mcmc(m, chains = 1, initial_values = initials(mu = -1))
##D 
##D # if there are multiple chains, a list of initial values should be passed,
##D # othewise the same initial values will be used for all chains
##D inits <- list(initials(sigma = 0.5), initials(sigma = 1))
##D draws <- mcmc(m, chains = 2, initial_values = inits)
##D 
##D # you can auto-generate a list of initials with something like this:
##D inits <- replicate(4,
##D                    initials(mu = rnorm(1), sigma = runif(1)),
##D                    simplify = FALSE)
##D draws <- mcmc(m, chains = 4, initial_values = inits)
##D 
##D # or find the MAP estimate
##D opt_res <- opt(m)
##D 
##D # get the MLE of the normal variance
##D mu <- variable()
##D variance <- variable(lower = 0)
##D distribution(x) <- normal(mu, sqrt(variance))
##D m2 <- model(variance)
##D 
##D # adjust = FALSE skips the jacobian adjustments used in MAP estimation, to
##D # give the true maximum likelihood estimates
##D o <- opt(m2, adjust = FALSE)
##D 
##D # the MLE corresponds to the *unadjusted* sample variance, but differs
##D # from the sample variance
##D o$par
##D mean((x - mean(x)) ^ 2)  # same
##D var(x)  # different
##D 
##D # initial values can also be passed to optimisers:
##D o <- opt(m2, initial_values = initials(variance = 1))
##D 
##D # and you can return a list of the hessians for each of these parameters
##D o <- opt(m2, hessians = TRUE)
##D o$hessians
##D 
##D 
##D # to get a hessian matrix across multiple greta arrays, you must first
##D # combine them and then split them up for use in the model (so that the
##D # combined vector is part of the model) and pass that vector to model:
##D params <- c(variable(), variable(lower = 0))
##D mu <- params[1]
##D variance <- params[2]
##D distribution(x) <- normal(mu, sqrt(variance))
##D m3 <- model(params)
##D o <- opt(m3, hessians = TRUE)
##D o$hessians
## End(Not run)



