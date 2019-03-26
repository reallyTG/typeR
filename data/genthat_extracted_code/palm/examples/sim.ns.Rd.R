library(palm)


### Name: sim.ns
### Title: Simulating points from a Neyman-Scott point process
### Aliases: sim.ns

### ** Examples

## Simulating from a one-dimensional Thomas process.
data.thomas <- sim.ns(c(D = 10, lambda = 5, sigma = 0.025), lims = rbind(c(0, 1)))
## Simulating from a three-dimensional Matern process.
data.matern <- sim.ns(c(D = 10, lambda = 10, tau = 0.1), disp = "uniform",
                      lims = rbind(c(0, 1), c(0, 2), c(0, 3)))




