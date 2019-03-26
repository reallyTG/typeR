library(HRW)


### Name: summMCMC
### Title: Summarizes Markov chain Monte Carlo (MCMC) samples both
###   graphically and numerically
### Aliases: summMCMC

### ** Examples

library(HRW)
xListSingleChain <- list(cbind(rnorm(100),rnorm(100),rnorm(100),rnorm(100)))
summMCMC(xListSingleChain,parNames = list("par1","par2","par3","par4"))
xListMultipleChains <- list(chain1 = cbind(rnorm(100),rnorm(100),rnorm(100),rnorm(100)),
                            chain2 = cbind(rnorm(100),rnorm(100),rnorm(100),rnorm(100)))
summMCMC(xListMultipleChains,parNames = list("par1","par2","par3","par4"))



