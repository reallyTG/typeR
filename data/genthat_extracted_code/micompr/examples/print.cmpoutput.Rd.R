library(micompr)


### Name: print.cmpoutput
### Title: Print information about comparison of an output
### Aliases: print.cmpoutput

### ** Examples


# Comparing the fifth output of the pphpc_diff dataset, which contains
# simulation output data from two implementations of the PPHPC model executed
# with a different parameter.

cmpoutput("WolfPop", 0.7, pphpc_diff$data[[5]], pphpc_diff$obs_lvls)




