library(brms)


### Name: epilepsy
### Title: Epileptic seizure counts
### Aliases: epilepsy
### Keywords: datasets

### ** Examples

## Not run: 
##D ## poisson regression without random effects. 
##D fit1 <- brm(count ~ log_Age_c + log_Base4_c * Trt_c, 
##D             data = epilepsy, family = poisson())
##D summary(fit1) 
##D plot(fit1)             
##D     
##D ## poisson regression with random intercepts of patients and visits
##D ## as well as normal priors for fixed effects parameters.    
##D fit2 <- brm(count ~ log_Age_c + log_Base4_c * Trt_c 
##D             + (1|patient) + (1|visit), 
##D             data = epilepsy, family = poisson(), 
##D             prior = set_prior("normal(0,5)"))
##D summary(fit2) 
##D plot(fit2)
## End(Not run)
 



