library(spfrontier)


### Name: spfrontier.true.value
### Title: True value for simulation
### Aliases: ezsimspfrontier spfrontier.true.value
### Keywords: frontier, simulation spatial stochastic

### ** Examples

params000 <- list(n=c(50, 100),beta0=5,
                 beta1=10,
                 beta2=1,
                 sigmaV=0.5, 
                 sigmaU=2.5)
ctrl <- list(seed=999, cores=1)
res000 <- ezsimspfrontier(2, params = params000,  
                 inefficiency = "half-normal",
                 logging = "info", 
                 control=ctrl)
summary(res000)



