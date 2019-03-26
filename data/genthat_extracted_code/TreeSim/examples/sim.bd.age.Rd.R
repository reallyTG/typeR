library(TreeSim)


### Name: sim.bd.age
### Title: sim.bd.age: Simulating birth-death trees of a fixed age.
### Aliases: sim.bd.age

### ** Examples

age<-2
lambda <- 2.0
mu <- 0.5
frac <-0.6
numbsim<-3

##
# Simulating trees with time age since the origin:

sim.bd.age(age,numbsim,lambda,mu,mrca=FALSE,complete=TRUE)
sim.bd.age(age,numbsim,lambda,mu,frac,mrca=FALSE,complete=FALSE)

# Simulating trees with time age since the time of the most recent common 
# ancestor of the extant and sampled species:

sim.bd.age(age,numbsim,lambda,mu,mrca=TRUE,complete=TRUE)
sim.bd.age(age,numbsim,lambda,mu,frac,mrca=TRUE,complete=FALSE)



