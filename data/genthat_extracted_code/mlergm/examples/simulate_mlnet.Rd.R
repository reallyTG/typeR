library(mlergm)


### Name: simulate_mlnet
### Title: Simulate a multilevel network
### Aliases: simulate_mlnet
### Keywords: simulation

### ** Examples


# Create a K = 2 block network with edge + gwesp term 
net <- simulate_mlnet(form = network.initialize(40, directed = FALSE) ~ edges + gwesp, 
                      node_memb = c(rep(1, 20), rep(2, 20)),
                      theta = c(-3, 0.5, 1.0), 
                      between_prob = 0.01,
                      options = set_options(number_cores = 2, burnin = 5000))

# Simulate a K = 2 block directed network, specifying a formula for between edges
net <- simulate_mlnet(form = network.initialize(40, directed = TRUE) ~ edges + gwesp,
                      node_memb = c(rep(1, 20), rep(2, 20)),
                      theta = c(-3, 0.5, 1.0),
                      between_form = ~ edges + mutual, 
                      between_theta = c(-4, 2),
                      options = set_options(number_cores = 2, burnin = 5000))



