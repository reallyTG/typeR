library(MNS)


### Name: plot.MNS
### Title: Plotting function for MNS objects
### Aliases: plot.MNS
### Keywords: MNS

### ** Examples

set.seed(1)
N=4
Net = gen.Network(method = "cohort", p = 10, 
                       Nsub = N, sparsity = .2, 
                       REsize = 20, REprob = .5,
                       REnoise = 1, Nobs = 10)
## Not run: 
##D # can plot simulated networks:
##D plot.MNS(Net, view="pop")
##D 
##D # can also plot results from MNS algorithm:
##D mns = MNS(dat = Net$Data, lambda_pop = .1, lambda_random = .1, parallel = TRUE)
##D plot.MNS(mns) # plot population network
##D plot.MNS(mns, view="var") # plot variance network
##D plot.MNS(mns, view="sub") # plot subject networks (note red edges here are variable edges!)
## End(Not run)




