library(ape)


### Name: node.dating
### Title: node.dating
### Aliases: node.dating estimate.mu estimate.dates
### Keywords: model

### ** Examples

t <- rtree(100)
tip.date <- rnorm(t$tip.label, mean = node.depth.edgelength(t)[1:Ntip(t)])^2
t <- rtt(t, tip.date)
mu <- estimate.mu(t, tip.date)

## Run for 100 steps
node.date <- estimate.dates(t, tip.date, mu, nsteps = 100)

## Run until the difference between successive log likelihoods is
## less than $10^{-4}$ starting with the 100th step's results
node.date <- estimate.dates(t, node.date, mu, nsteps = 0, lik.tol = 1e-4)

## To rescale the tree over time
t$edge.length <- node.date[t$edge[, 2]] - node.date[t$edge[, 1]]



