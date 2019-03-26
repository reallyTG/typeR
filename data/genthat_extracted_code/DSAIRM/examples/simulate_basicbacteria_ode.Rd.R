library(DSAIRM)


### Name: simulate_basicbacteria_ode
### Title: Basic Bacteria model - ODE
### Aliases: simulate_basicbacteria_ode

### ** Examples

# To run the simulation with default parameters:
result <- simulate_basicbacteria_ode()
# To run the simulation with different parameter or starting values,
# supply the ones you want to change.
# all other parameters will be kept at their default values shown in the function call above
result <- simulate_basicbacteria_ode(B = 100, g = 0.5, dI = 2)



