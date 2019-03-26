library(ratematrix)


### Name: logAnalyzer
### Title: Make analysis of the log file of the MCMC chain
### Aliases: logAnalyzer

### ** Examples

## No test: 
## Load data
data(centrarchidae)
## Run MCMC. This is just a very short chain.
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, gen=10000
                         , dir=tempdir())
## Load posterior distribution, make plots and check the log.
posterior <- readMCMC(handle, burn=0.1, thin=10)
plotRatematrix(posterior)
logAnalyzer(handle, burn=0.1, thin=10)
## End(No test)



