library(leabRa)


### Name: layer
### Title: Leabra layer class
### Aliases: layer
### Keywords: data

### ** Examples

l <- layer$new(c(5, 5)) # create a 5 x 5 layer with default leabra values

l$g_e_avg # private values cannot be accessed
# if you want to see alle variables, you need to use the function
l$get_layer_vars(show_dynamics = TRUE, show_constants = TRUE)
# if you want to see a summary of all units without constant values
l$get_unit_vars(show_dynamics = TRUE, show_constants = FALSE)

# let us clamp the activation of the 25 units to some random values between
# 0.05 and 0.95
l <- layer$new(c(5, 5))
activations <- runif(25, 0.05, .95)
l$avg_act
l$clamp_cycle(activations)
l$avg_act
# what happened to the unit activations?
l$get_unit_acts()
# compare with activations
activations
# scaled activations are scaled by the average activation of the layer and
# should be smaller
l$get_unit_scaled_acts()




