library(brms)


### Name: posterior_samples.brmsfit
### Title: Extract posterior samples
### Aliases: posterior_samples.brmsfit as.data.frame.brmsfit
###   as.matrix.brmsfit as.array.brmsfit posterior_samples
###   posterior.samples posterior.samples.brmsfit

### ** Examples

## Not run: 
##D fit <- brm(rating ~ treat + period + carry + (1|subject), 
##D            data = inhaler, family = "cumulative")
##D 
##D # extract posterior samples of population-level effects 
##D samples1 <- posterior_samples(fit, "^b")
##D head(samples1)
##D 
##D # extract posterior samples of group-level standard deviations
##D samples2 <- posterior_samples(fit, "^sd_")
##D head(samples2)
## End(Not run)




