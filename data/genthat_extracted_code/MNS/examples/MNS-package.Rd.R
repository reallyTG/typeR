library(MNS)


### Name: MNS-package
### Title: Mixed Neighbourhood Selection package
### Aliases: MNS-package MNS-package
### Keywords: package

### ** Examples

set.seed(1)
N=4
Net = gen.Network(method = "cohort", p = 10, 
                       Nsub = N, sparsity = .2, 
                       REsize = 20, REprob = .5,
                       REnoise = 1, Nobs = 10)
## Not run: 
##D # plot simulated networks:
##D plot(Net, view="pop")
##D 
##D # run MNS algorithm:
##D mns = MNS(dat = Net$Data, lambda_pop = .1, lambda_random = .1, parallel = TRUE)
##D 
##D # plot results from MNS algorithm:
##D plot(mns) # plot population network
##D plot(mns, view="var") # plot variance network
##D plot(mns, view="sub") # plot subject networks (note red edges here are variable edges!)
## End(Not run)



