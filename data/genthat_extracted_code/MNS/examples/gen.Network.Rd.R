library(MNS)


### Name: gen.Network
### Title: Simulate random networks for a population of subjects
### Aliases: gen.Network

### ** Examples

# generate data according to cohort model of Monti et al. (2015)
set.seed(1)
Dat = gen.Network(p = 10, Nsub = 5, 
 sparsity = .2, REsize=10, REprob=.5, 
 REnoise = 1, Nobs=20)

## Not run: 
##D # plot simulated networks:
##D plot(Net, view="pop")
## End(Not run)



