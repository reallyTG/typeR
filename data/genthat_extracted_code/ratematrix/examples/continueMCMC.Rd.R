library(ratematrix)


### Name: continueMCMC
### Title: Continue unfinished MCMC chain or add more generations
### Aliases: continueMCMC

### ** Examples

## No test: 
## Continue unfinished run.
data(centrarchidae)
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, gen=10000
                         , dir=tempdir())
## Now add generations to the same MCMC chain.
handle.add <- continueMCMC(handle=handle, add.gen=10000)
## End(No test)



