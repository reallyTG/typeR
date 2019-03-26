library(micompr)


### Name: summary.cmpoutput
### Title: Summary method for comparison of an output
### Aliases: summary.cmpoutput

### ** Examples


# Comparing the concatenated output of the pphpc_noshuff dataset, which
# contains simulation output data from two implementations of the PPHPC model
# executed with a minor implementation difference.

summary(
  cmpoutput("All", 0.6, pphpc_noshuff$data[["All"]], pphpc_noshuff$obs_lvls)
)




