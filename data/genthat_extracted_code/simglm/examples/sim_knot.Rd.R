library(simglm)


### Name: sim_knot
### Title: Simulate knot locations
### Aliases: sim_knot

### ** Examples

sim_knot(0:10, knot_locations = c(4, 9))
sim_knot(rnorm(100), knot_locations = c(-1, 1.5))
sim_knot(0:8, knot_locations = 5)   
sim_knot(0:8, knot_locations = 5, right = TRUE)  



