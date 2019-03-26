library(nimble)


### Name: nimbleModel
### Title: Create a NIMBLE model from BUGS code
### Aliases: nimbleModel

### ** Examples

code <- nimbleCode({
    x ~ dnorm(mu, sd = 1)
    mu ~ dnorm(0, sd = prior_sd)
})
constants = list(prior_sd = 1)
data = list(x = 4)
Rmodel <- nimbleModel(code, constants = constants, data = data)



