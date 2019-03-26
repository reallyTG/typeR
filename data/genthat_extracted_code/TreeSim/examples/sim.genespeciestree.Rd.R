library(TreeSim)


### Name: sim.genespeciestree
### Title: sim.genespeciestree: Simulating birth-death species trees with
###   nested coalescent gene trees.
### Aliases: sim.genespeciestree

### ** Examples

#Simulate two gene trees within two species trees:
n<-10
lambda <- 2.0
mu <- 0.5
frac <-0.6
numbsim<-2
age<-2

# Simulation is conditioned on 10 final tips
sim.genespeciestree(n, numbsim, lambda, mu, frac, 0)

# Simulation is conditioned on 10 final tips and tree age 2
sim.genespeciestree(n, numbsim, lambda, mu, frac, age)



