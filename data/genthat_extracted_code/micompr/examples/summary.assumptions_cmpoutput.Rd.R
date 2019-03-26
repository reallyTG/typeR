library(micompr)


### Name: summary.assumptions_cmpoutput
### Title: Summary method for the assumptions of parametric tests used in a
###   comparison of an output
### Aliases: summary.assumptions_cmpoutput

### ** Examples


# Create a cmpoutput object from the provided datasets
cmp <- cmpoutput("All", c(0.5, 0.6, 0.7),
                 pphpc_ok$data[["All"]], pphpc_ok$obs_lvls)

# Obtain the summary of the assumptions of the cmpoutput object
summary(assumptions(cmp))




