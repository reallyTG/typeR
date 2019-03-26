library(RPANDA)


### Name: likelihood_sgd
### Title: Likelihood of a phylogeny under the SGD model
### Aliases: likelihood_sgd

### ** Examples

data(Cetacea)
tot_time <- max(node.age(Cetacea)$ages)
b <- 1e6
d <- 1e6-0.5
nu <- 0.6
f <- 87/89
#lh <- likelihood_sgd(Cetacea, tot_time, b, d, nu, f)



