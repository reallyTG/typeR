library(NetworkInference)


### Name: simulate_cascades
### Title: Simulate cascades from a diffusion network
### Aliases: simulate_cascades

### ** Examples


data(cascades) 
out <- netinf(cascades, trans_mod = "exponential", n_edges = 5, params = 1)
simulated_cascades <- simulate_cascades(out, nsim = 10)
 
# Simulation from partial cascade




