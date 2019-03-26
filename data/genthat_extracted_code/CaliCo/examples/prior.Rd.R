library(CaliCo)


### Name: prior
### Title: Generates 'prior.class' objects.
### Aliases: prior

### ** Examples

## Not run: 
##D #### Only one prior is wanted
##D ## For a Gaussian Prior
##D gaussian <- prior(type.prior="gaussian",opt.prior=list(c(0.5,0.001)))
##D plot(gaussian)
##D 
##D #### For several priors
##D priors <- prior(type.prior=c("gaussian","gamma"),opt.prior=list(c(0.5,0.001),c(5,1)))
##D plot(priors$Prior1)
##D plot(priors$Prior2)
## End(Not run)



