library(nimble)


### Name: readBUGSmodel
### Title: Create a NIMBLE BUGS model from a variety of input formats,
###   including BUGS model files
### Aliases: readBUGSmodel

### ** Examples

code <- nimbleCode({
    x ~ dnorm(mu, sd = 1)
    mu ~ dnorm(0, sd = prior_sd)
})
data = list(prior_sd = 1, x = 4)
model <- readBUGSmodel(code, data = data, inits = list(mu = 0))
model$x
model[['mu']]
model$calculate('x')



