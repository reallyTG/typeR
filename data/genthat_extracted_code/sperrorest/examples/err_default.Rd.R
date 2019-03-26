library(sperrorest)


### Name: err_default
### Title: Default error function
### Aliases: err_default

### ** Examples

obs <- rnorm(1000)
# Two mock (soft) classification examples:
err_default( obs > 0, rnorm(1000) ) # just noise
err_default( obs > 0, obs + rnorm(1000) ) # some discrimination
# Three mock regression examples:
err_default( obs, rnorm(1000) ) # just noise, but no bias
err_default( obs, obs + rnorm(1000) ) # some association, no bias
err_default( obs, obs + 1 ) # perfect correlation, but with bias




