library(nimble)


### Name: nimbleCode
### Title: Turn BUGS model code into an object for use in 'nimbleModel' or
###   'readBUGSmodel'
### Aliases: nimbleCode

### ** Examples

code <- nimbleCode({
    x ~ dnorm(mu, sd = 1)
    mu ~ dnorm(0, sd = prior_sd)
})



