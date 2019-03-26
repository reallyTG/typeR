library(ezsim)


### Name: plot.summary.ezsim
### Title: Plot an summary.ezsim Object
### Aliases: plot.summary.ezsim

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
##D ## Plot the summary ezsim
##D plot(summary(ezsim_basic,c("q25","q75")))
##D plot(summary(ezsim_basic,c("q25","q75"),subset=list(estimator='mean_hat')))
##D plot(summary(ezsim_basic,c("median"),subset=list(estimator='sd_mean_hat')))
## End(Not run)



