library(rstan)


### Name: summary-methods
### Title: Summary method for stanfit objects
### Aliases: summary,stanfit-method
### Keywords: methods

### ** Examples
## Not run: 
##D ecode <- '
##D   parameters {
##D     real<lower=0> y[2];
##D   } 
##D   model {
##D     y ~ exponential(1);
##D   }
##D '
##D fit <- stan(model_code = ecode)
##D s <- summary(fit, probs = c(0.1, 0.9))
##D s$summary  # all chaines merged
##D s$c_summary  # individual chains
## End(Not run)



