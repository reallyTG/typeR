library(micompr)


### Name: assumptions.cmpoutput
### Title: Get assumptions for parametric tests performed on output
###   comparisons
### Aliases: assumptions.cmpoutput

### ** Examples


# Create a cmpoutput object from the provided datasets
cmp <- cmpoutput("All", 0.9, pphpc_ok$data[["All"]], pphpc_ok$obs_lvls)

# Get the assumptions for the parametric tests performed in cmp
acmp <- assumptions(cmp)




