library(TreeSim)


### Name: cuttree
### Title: cuttree: Cutting off the tree to prune recent branches.
### Aliases: cuttree

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

trees<-sim.bd.taxa.age(n, numbsim, lambda, mu, frac, age, mrca = FALSE)

treec<-cuttree(trees[[1]],0.3)

plot(trees[[1]])
plot(treec)



