library(texmex)


### Name: simulate.evmOpt
### Title: Simulate from a fitted evm object
### Aliases: simulate.evmOpt simulate.evmSim simulate.evmBoot
### Keywords: models

### ** Examples


mod <- evm(rain, qu=.95)
hist(simulate(mod, 100))




