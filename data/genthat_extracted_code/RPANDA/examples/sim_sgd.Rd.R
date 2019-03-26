library(RPANDA)


### Name: sim_sgd
### Title: Algorithm for simulating a phylogenetic tree under the SGD model
### Aliases: sim_sgd

### ** Examples

tau <- 10
b <- 1e6
d <- b-0.5
nu <- 0.6
tree <- sim_sgd(tau,b,d,nu)
plot(tree)



