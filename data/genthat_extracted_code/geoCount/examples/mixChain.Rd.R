library(geoCount)


### Name: mixChain
### Title: Mix Parallel Markov Chains
### Aliases: mixChain
### Keywords: MCMC

### ** Examples

## Not run: 
##D res.prl <- runMCMC.multiChain(Y, L=0, loc=loc, X=loc, 
##D             MCMCinput = input, n.chn = 5)
##D res.m.prl <- lapply(res.prl, cutChain, chain.ind=1:4, burnin=200, thining=20)
##D res.mix <- mixChain(res.m.prl)
## End(Not run)



