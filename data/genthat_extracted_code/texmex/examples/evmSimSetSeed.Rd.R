library(texmex)


### Name: evmSimSetSeed
### Title: Set the seed from a fitted evmSim object.
### Aliases: evmSimSetSeed

### ** Examples

 ## No test: 
 
 data <- rnorm(1000)
 mod <- evm(data, qu=.7, method="simulate")
 evmSimSetSeed(mod)
 mod1 <- evm(data, qu=.7, method="simulate") # this produces the same MCMC output as mod
## End(No test)




