library(TreeSim)


### Name: sim.rateshift.taxa
### Title: sim.rateshift.taxa: Simulating trees incorporating mass
###   extinction events and rate shifts.
### Aliases: sim.rateshift.taxa

### ** Examples

n<-10
numbsim<-1

##
# Simulating trees with a fixed number of species having shifts in rate
# and mass extinction events.
# Between today and time 0.3 in the past, we have speciation rate 2,
# extinction rate 0. At time 0.3, we have a mass extinction event which
# 10% of the species survive. Prior to 0.3, we have a speciation rate 
# of 1 and an extinction rate of 0.3:

sim.rateshift.taxa(n,numbsim,c(2,1),c(0,0.3),
c(1,0.1),c(0,0.3),complete=TRUE)

# The fraction 0.6 of the extant species is included into the final tree
# (the tree has n species AFTER sampling, extinct and
# non-sampled lineages are not included):

sim.rateshift.taxa(n,numbsim,c(2,1),c(0,0.3),
c(0.6,0.1),c(0,0.3),complete=FALSE)



