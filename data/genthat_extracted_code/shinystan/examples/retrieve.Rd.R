library(shinystan)


### Name: retrieve
### Title: Get summary statistics from shinystan object
### Aliases: retrieve

### ** Examples

# Using example shinystan object 'eight_schools'
sso <- eight_schools
retrieve(sso, "rhat")
retrieve(sso, "mean", pars = c('theta[1]', 'mu'))
retrieve(sso, "quantiles")
retrieve(sso, "max_treedepth")  # equivalent to retrieve(sso, "depth"), retrieve(sso, "tree"), etc.
retrieve(sso, "prop_divergent")
retrieve(sso, "prop_divergent", inc_warmup = TRUE)




