library(brms)


### Name: pp_mixture.brmsfit
### Title: Posterior Probabilities of Mixture Component Memberships
### Aliases: pp_mixture.brmsfit pp_mixture

### ** Examples

## Not run: 
##D ## simulate some data
##D set.seed(1234)
##D dat <- data.frame(
##D   y = c(rnorm(100), rnorm(50, 2)), 
##D   x = rnorm(150)
##D )
##D ## fit a simple normal mixture model
##D mix <- mixture(gaussian, nmix = 2)
##D prior <- c(
##D   prior(normal(0, 5), Intercept, nlpar = mu1),
##D   prior(normal(0, 5), Intercept, nlpar = mu2),
##D   prior(dirichlet(2, 2), theta)
##D )
##D fit1 <- brm(bf(y ~ x), dat, family = mix,
##D             prior = prior, chains = 2, inits = 0)
##D summary(fit1)
##D    
##D ## compute the membership probabilities         
##D ppm <- pp_mixture(fit1)
##D str(ppm)
##D 
##D ## extract point estimates for each observation
##D head(ppm[, 1, ])
##D 
##D ## classify every observation according to 
##D ## the most likely component
##D apply(ppm[, 1, ], 1, which.max)
## End(Not run)




