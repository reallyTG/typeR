library(TreeSim)


### Name: sim.bd.taxa
### Title: sim.bd.taxa: Simulating birth-death trees on a fixed number of
###   extant taxa.
### Aliases: sim.bd.taxa

### ** Examples

n<-10
lambda <- 2.0
mu <- 0.5
frac <-0.6
numbsim<-2

##
# Simulating numbsim trees with n species under a birth-death process with 
# speciation rate lambda an extinction rate mu:

sim.bd.taxa(n,numbsim,lambda,mu)

# Each extant species is included in final tree with probability frac 
# (the tree has n species AFTER sampling):

sim.bd.taxa(n,numbsim,lambda,mu,frac,complete=FALSE,stochsampling=TRUE)

# A fraction frac of the extant species is included into the final tree 
# (the tree has n species AFTER sampling):

sim.bd.taxa(n,numbsim,lambda,mu,frac,complete=FALSE,stochsampling=FALSE)




