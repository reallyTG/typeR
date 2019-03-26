library(outbreaker2)


### Name: custom_priors
### Title: Customise priors for outbreaker
### Aliases: custom_priors print.custom_priors

### ** Examples


## BASIC CONFIGURATION
custom_priors()


## SPECIFYING PRIOR PARAMETERS
## - this will need to be passed to outbreaker
default_config <- create_config()
new_config <- create_config(prior_mu = 1e-5,
                        prior_pi = c(2, 1))

## - to check the prior manually, default settings:
param <- list(mu = 0.001, pi = 0.9)
outbreaker2:::cpp_prior_mu(param, default_config)
outbreaker2:::cpp_prior_pi(param, default_config)

outbreaker2:::cpp_prior_mu(param, new_config)
outbreaker2:::cpp_prior_pi(param, new_config)

## these correspond to:
dexp(0.001, 0.01, log = TRUE)
dbeta(0.9, 2, 1, log = TRUE)


## SPECIFYING A PRIOR FUNCTION

## flat prior for pi between 0.5 and 1
f <- function(x) {ifelse(x$pi > 0.5, log(2), log(0))}
priors <- custom_priors(pi = f)
priors # this should be passed to outbreaker

## test the prior manually
priors$pi(list(pi=1))
priors$pi(list(pi=.6))
priors$pi(list(pi=.2))
priors$pi(list(pi=.49))




