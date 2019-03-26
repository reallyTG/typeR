library(micompr)


### Name: plot.cmpoutput
### Title: Plot comparison of an output
### Aliases: plot.cmpoutput

### ** Examples


# Comparing the concatenated output of the pphpc_ok dataset, which
# contains simulation output data from two similar implementations of the
# PPHPC model.

plot(cmpoutput("All", 0.95, pphpc_ok$data[["All"]], pphpc_ok$obs_lvls))




