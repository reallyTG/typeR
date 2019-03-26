library(Bolstad2)


### Name: thin
### Title: Thin an MCMC sample
### Aliases: thin

### ** Examples

## A blockwise Metropolis-Hastings chain of 1000 elements, thinned to
## 5th element
##

MCMCSampleBW <- bivnormMH(0.9, type = 'block')
MCMCSampleBW <- thin(MCMCSampleBW, 5)



