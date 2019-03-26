library(TreeSim)


### Name: sim.bd.taxa.age
### Title: sim.bd.taxa.age: Simulating birth-death trees with a given age
###   on a fixed number of extant taxa.
### Aliases: sim.bd.taxa.age

### ** Examples

n<-10
lambda <- 2.0
mu <- 0.5
frac <-0.6
numbsim<-2
age<-2

##
# Simulating numbsim reconstructed trees with n sampled species under a
# birth-death process with speciation rate lambda, extinction rate mu,
# sampling probability frac, and time age since origin:

sim.bd.taxa.age(n, numbsim, lambda, mu, frac, age, mrca = FALSE)

# Simulating numbsim reconstructed trees with n sampled species under a
# birth-death process with speciation rate lambda, extinction rate mu,
# sampling probability frac, and time age since the most recent 
# common ancestor of the extant sampled species:

sim.bd.taxa.age(n, numbsim, lambda, mu, frac, age, mrca = TRUE)




