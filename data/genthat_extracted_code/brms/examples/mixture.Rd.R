library(brms)


### Name: mixture
### Title: Finite Mixture Families in 'brms'
### Aliases: mixture

### ** Examples

## Not run: 
##D ## simulate some data
##D set.seed(1234)
##D dat <- data.frame(
##D   y = c(rnorm(200), rnorm(100, 6)), 
##D   x = rnorm(300),
##D   z = sample(0:1, 300, TRUE)
##D )
##D 
##D ## fit a simple normal mixture model
##D mix <- mixture(gaussian, gaussian)
##D prior <- c(
##D   prior(normal(0, 7), Intercept, dpar = mu1),
##D   prior(normal(5, 7), Intercept, dpar = mu2)
##D )
##D fit1 <- brm(bf(y ~ x + z), dat, family = mix,
##D             prior = prior, chains = 2) 
##D summary(fit1)
##D pp_check(fit1)
##D 
##D ## use different predictors for the components
##D fit2 <- brm(bf(y ~ 1, mu1 ~ x, mu2 ~ z), dat, family = mix,
##D             prior = prior, chains = 2) 
##D summary(fit2)
##D 
##D ## fix the mixing proportions
##D fit3 <- brm(bf(y ~ x + z, theta1 = 1, theta2 = 2), 
##D             dat, family = mix, prior = prior, 
##D             inits = 0, chains = 2)
##D summary(fit3)
##D pp_check(fit3)    
##D 
##D ## predict the mixing proportions
##D fit4 <- brm(bf(y ~ x + z, theta2 ~ x), 
##D             dat, family = mix, prior = prior, 
##D             inits = 0, chains = 2)
##D summary(fit4)
##D pp_check(fit4)           
##D 
##D ## compare model fit
##D LOO(fit1, fit2, fit3, fit4)  
## End(Not run)




