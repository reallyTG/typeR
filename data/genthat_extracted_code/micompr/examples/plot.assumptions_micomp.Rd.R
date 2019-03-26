library(micompr)


### Name: plot.assumptions_micomp
### Title: Plot _p_-values for testing the assumptions of the parametric
###   tests used in multiple output comparison
### Aliases: plot.assumptions_micomp

### ** Examples

## No test: 
# Create a micomp object, use provided dataset
mic <- micomp(6, 0.65,
              list(list(name = "NLOKvsJEXOK", grpout = pphpc_ok),
                   list(name = "NLOKvsJEXNOSHUFF", grpout = pphpc_noshuff),
                   list(name = "NLOKvsJEXDIFF", grpout = pphpc_diff)))

# Plot the p-values of the statistic tests evaluating the assumptions of the
# comparisons performed in the mic object
plot(assumptions(mic))
## End(No test)



