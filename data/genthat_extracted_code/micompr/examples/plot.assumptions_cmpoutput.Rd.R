library(micompr)


### Name: plot.assumptions_cmpoutput
### Title: Plot _p_-values for testing the assumptions of the parametric
###   tests used in output comparison
### Aliases: plot.assumptions_cmpoutput

### ** Examples


# Create a cmpoutput object from the provided datasets
cmp <- cmpoutput("All", 0.9, pphpc_ok$data[["All"]], pphpc_ok$obs_lvls)

# Display a bar plot with the p-values of the assumptions for the parametric
# tests performed in cmp
plot(assumptions(cmp))




