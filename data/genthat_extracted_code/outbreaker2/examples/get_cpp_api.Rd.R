library(outbreaker2)


### Name: get_cpp_api
### Title: Access internal C++ rountines used in outbreaker2
### Aliases: get_cpp_api

### ** Examples


## get functions in an environment
api <- get_cpp_api()
api

## check content of the environment
ls(api)

## test the prior for mu
args(api$cpp_prior_mu)

config <- create_config()

api$cpp_prior_mu(list(mu = 0.00123), config)

dexp(0.00123, rate = config$prior_mu, log = TRUE)




