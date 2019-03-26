library(ezsim)


### Name: test.ezsim
### Title: Perform a Test for an ezsim Object
### Aliases: test.ezsim

### ** Examples

## Not run: 
##D ezsim_basic<-ezsim(
##D     m             = 100,
##D     run           = FALSE,
##D     run_test      = FALSE,
##D     display_name  = c(mean_hat="hat(mu)",sd_mean_hat="hat(sigma[hat(mu)])"),
##D     parameter_def = createParDef(list(n=seq(20,80,20),mu=c(0,2),sigma=c(1,3,5))),
##D     dgp           = function() rnorm(n,mu,sigma),
##D     estimator     = function(x) c(mean_hat = mean(x),
##D                                  sd_mean_hat=sd(x)/sqrt(length(x)-1)),
##D     true_value    = function() c(mu, sigma / sqrt(n-1))
##D )
##D 
##D test(ezsim_basic,print_result=TRUE)
## End(Not run)



