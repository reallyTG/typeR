library(leabRa)


### Name: network
### Title: Leabra network class
### Aliases: network
### Keywords: data

### ** Examples

# create a small network with 3 layers
dim_lays <- list(c(2, 5), c(2, 10), c(2, 5))
cxn <- matrix(c(0, 0, 0,
                1, 0, 0.2,
                0, 1, 0), nrow = 3, byrow = TRUE)
net <- network$new(dim_lays, cxn)

net$m_in_s # private values cannot be accessed
# if you want to see alle variables, you need to use the function
net$get_network_vars(show_dynamics = TRUE, show_constants = TRUE)
# if you want to see a summary of all units (with layer information) without
# constant values
net$get_layer_and_unit_vars(show_dynamics = TRUE, show_constants = FALSE)

# let us create 10 random inputs for layer 1 and 3
inputs <- net$create_inputs(c(1, 3), 10)
inputs # a list of lists

# the input in layer 1 should be associated with the output in layer 3; we
# can use error driven learning to achieve this

# first we will need the input for the minus phase (where no correct output
# is presented; layer 3 is NULL)
inputs_minus <- lapply(inputs, function(x) replace(x, 3, list(NULL)))
inputs_minus # layer 3 is indeed NULL
# now we can learn with default parameters; we will run 10 epochs,
# inputs_plus is equivalent to inputs; the output will be activations after
# each trial for the wohle network; this might take a while depending on your
# system
n_epochs <- 10
## Not run: 
##D output <- lapply(seq(n_epochs),
##D                  function(x) net$learn_error_driven(inputs_minus,
##D                                                     inputs,
##D                                                     lrate = 0.5))
##D # let's compare the actual output with what should have been learned we can
##D # use the method mad_per_epoch for this; it will calculate the mean absolute
##D # distance for each epoch; we are interested in layer 3
##D mad <- net$mad_per_epoch(output, inputs, 3)
##D # the error should decrease with increasing epoch number
##D plot(mad)
## End(Not run)




