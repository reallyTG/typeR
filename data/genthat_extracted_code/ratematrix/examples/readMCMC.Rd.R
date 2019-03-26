library(ratematrix)


### Name: readMCMC
### Title: Read the MCMC output files
### Aliases: readMCMC

### ** Examples

## No test: 
## Load data
data(centrarchidae)
## Run MCMC. This is just a very short chain.
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, gen=1000
                         , dir=tempdir())
## Load posterior distribution, make plots and check the log.
posterior <- readMCMC(handle, burn=0.25, thin=1)
plotRatematrix(posterior)
plotRootValue(posterior)
plotPrior(handle)
plotPrior(handle, root=TRUE)
logAnalyzer(handle)
## End(No test)



