library(ezsim)


### Name: summary.ezsim
### Title: Summarize an ezsim Object
### Aliases: summary.ezsim
### Keywords: post-simulation

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
##D 
##D 
##D 
##D ## Summary of an ezsim object
##D summary(ezsim_basic)
##D 
##D ## Summary of a subset of ezsim object
##D summary(ezsim_basic,subset=list(estimator='mean_hat',n=c(20,40),sigma=c(1,3)))
##D 
##D ## More Summary Statistics
##D summary(ezsim_basic,simple=FALSE,subset=list(estimator='mean_hat',n=c(20,40),sigma=c(1,3)))
##D 
##D ## Customize the Summary Statistics
##D summary(ezsim_basic,stat=c("q25","median","q75"),Q025=quantile(value_of_estimator,0.025),
##D   Q975=quantile(value_of_estimator,0.975),subset=list(estimator='mean_hat',n=c(20,40),sigma=c(1,3)))
## End(Not run)



