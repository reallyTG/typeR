library(MNS)


### Name: MNS
### Title: Mixed Neighbourhood Selection
### Aliases: MNS
### Keywords: MNS

### ** Examples

set.seed(1)
N=4
Net = gen.Network(method = "cohort", p = 10, 
                       Nsub = N, sparsity = .2, 
                       REsize = 20, REprob = .5,
                       REnoise = 1, Nobs = 10)
## Not run: 
##D mns = MNS(dat = Net$Data, lambda_pop = .1, lambda_random = .1, parallel = TRUE)
##D # plot results:
##D plot(mns) # plot population network
##D plot(mns, view="var") # plot variance network
##D plot(mns, view="sub") # plot subject networks (note red edges here are variable edges!)
##D 
## End(Not run)



