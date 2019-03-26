library(brms)


### Name: prior_samples.brmsfit
### Title: Extract prior samples
### Aliases: prior_samples.brmsfit prior_samples

### ** Examples

## Not run: 
##D fit <- brm(rating ~ treat + period + carry + (1|subject), 
##D            data = inhaler, family = "cumulative", 
##D            prior = set_prior("normal(0,2)", class = "b"), 
##D            sample_prior = TRUE)
##D 
##D # extract all prior samples
##D samples1 <- prior_samples(fit)
##D head(samples1)
##D 
##D # extract prior samples for the population-level effects of 'treat'
##D samples2 <- prior_samples(fit, "b_treat")
##D head(samples2)
## End(Not run)




