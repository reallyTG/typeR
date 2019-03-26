library(ezsim)


### Name: subset.ezsim
### Title: Return of the Simulation
### Aliases: subset.ezsim

### ** Examples

## Not run: 
##D ezsim_basic<-ezsim(
##D     m             = 100,
##D     run           = TRUE,
##D     display_name  = c(mean_hat="hat(mu)",sd_mean_hat="hat(sigma[hat(mu)])"),
##D     parameter_def = createParDef(list(n=seq(20,80,20),mu=c(0,2),sigma=c(1,3,5))),
##D     dgp           = function() rnorm(n,mu,sigma),
##D     estimator     = function(x) c(mean_hat = mean(x),
##D                                  sd_mean_hat=sd(x)/sqrt(length(x)-1)),
##D     true_value    = function() c(mu, sigma / sqrt(n-1))
##D )
##D subset(ezsim_basic,subset=list(estimator='mean_hat',mu=0,n=c(20,40)))
## End(Not run)



