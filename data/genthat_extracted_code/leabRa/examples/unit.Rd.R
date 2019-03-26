library(leabRa)


### Name: unit
### Title: Leabra unit (neuron) class
### Aliases: unit
### Keywords: data

### ** Examples

u <- unit$new() # creates a new unit with default leabra values

print(u) # a lot of private values
u$v # private values cannot be accessed
# if you want to see alle variables, you need to use the function
u$get_vars(show_dynamics = TRUE, show_constants = TRUE)

# let us clamp the activation to 0.7
u$activation
u$clamp_cycle(0.7)
c(u$activation, u$avg_s, u$avg_m, u$avg_l)
# activation is indeed 0.7, but avg_l was not updated, this only happens
# before the weights are changed, let us update it now
u$updt_avg_l()
c(u$activation, u$avg_s, u$avg_m, u$avg_l)
# seems to work

# let us run 10 cycles with unclamped activation and output the activation
# produced because of changes in conductance
u <- unit$new()
cycle_number <- 1:10
result <- lapply(cycle_number, function(x)
                 u$cycle(g_e_raw = 0.5, g_i = 0.5)$get_vars())
# make a data frame out of the list
result <- plyr::ldply(result)
# plot activation
plot(result$activation, type = "b", xlab = "cycle", ylab = "activation")
# add conductance g_e to plot, should approach g_e_raw
lines(result$g_e, type = "b", col = "blue")




