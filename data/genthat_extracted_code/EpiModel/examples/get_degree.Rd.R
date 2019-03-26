library(EpiModel)


### Name: get_degree
### Title: Get Individual Degree from Network or Edgelist
### Aliases: get_degree

### ** Examples

nw <- network.initialize(500, directed = FALSE)

set.seed(1)
fit <- ergm(nw ~ edges, target.stats = 250)
sim <- simulate(fit)

# Slow ERGM-based method
ergm.method <- unname(summary(sim ~ sociality(base = 0)))
ergm.method

# Fast tabulate method with network object
deg.net <- get_degree(sim)
deg.net

# Even faster if network already transformed into an edgelist
el <- as.edgelist(sim)
deg.el <- get_degree(el)
deg.el

identical(as.integer(ergm.method), deg.net, deg.el)




