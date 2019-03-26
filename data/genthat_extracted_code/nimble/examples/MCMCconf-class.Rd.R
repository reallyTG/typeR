library(nimble)


### Name: MCMCconf-class
### Title: Class 'MCMCconf'
### Aliases: MCMCconf MCMCconf-class addMonitors addMonitors2 addSampler
###   getMonitors getMonitors2 getSamplerExecutionOrder getSamplers
###   printMonitors printSamplers removeSamplers resetMonitors
###   setSamplerExecutionOrder setSamplers setThin setThin2

### ** Examples

code <- nimbleCode({
 mu ~ dnorm(0, 1)
 x ~ dnorm(mu, 1)
})
Rmodel <- nimbleModel(code)
conf <- configureMCMC(Rmodel)
conf$setSamplers(1)
conf$addSampler(target = 'x', type = 'slice', control = list(adaptInterval = 100))
conf$addMonitors('mu')
conf$addMonitors2('x')
conf$setThin(5)
conf$setThin2(10)
conf$printMonitors()
conf$printSamplers()



