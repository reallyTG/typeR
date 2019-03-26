library(kendallRandomWalks)


### Name: simulate_kendall_rw
### Title: Simulate multiple trajectories of Kendall random walk
### Aliases: simulate_kendall_rw

### ** Examples

kendall_simulations <- simulate_kendall_rw(10, 1000, runif, 0.5)
# Kendall R.W. on positive half-line with uniform step distribution - 10 trajectories.
only_simulations <- kendall_simulations$simulation # tibble with simulated values
kendall_simulations





