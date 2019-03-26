library(ergm)


### Name: network.list
### Title: A convenience container for a list of 'network' objects, output
###   by 'simulate.ergm' among others.
### Aliases: network.list print.network.list summary.network.list

### ** Examples


# Draw from a Bernoulli model with 16 nodes
# and tie probability 0.1
#
g.use <- network(16, density=0.1, directed=FALSE)
#
# Starting from this network let's draw 3 realizations
# of a model with edges and 2-star terms
#
g.sim <- simulate(~edges+kstar(2), nsim=3, coef=c(-1.8, 0.03),
               basis=g.use, control=control.simulate(
                 MCMC.burnin=100000,
                 MCMC.interval=1000))
print(g.sim)
summary(g.sim)




