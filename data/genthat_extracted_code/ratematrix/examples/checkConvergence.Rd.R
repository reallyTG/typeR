library(ratematrix)


### Name: checkConvergence
### Title: Performs convergence tests
### Aliases: checkConvergence

### ** Examples

## No test: 
data(centrarchidae)
handle1 <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, gen=10000
                          , dir=tempdir())
posterior1 <- readMCMC(handle1, burn=0.25, thin=10)
handle2 <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, gen=10000
                          , dir=tempdir())
posterior2 <- readMCMC(handle2, burn=0.25, thin=1)
## Note that these are short chains used here as example only.
## A convergence test using 'Gelman's R' calculated from two independent MCMC chains.
checkConvergence(posterior1, posterior2)
## End(No test)



