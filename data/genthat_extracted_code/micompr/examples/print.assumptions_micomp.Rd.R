library(micompr)


### Name: print.assumptions_micomp
### Title: Print information about the assumptions concerning the
###   parametric tests performed on multiple comparisons of outputs
### Aliases: print.assumptions_micomp

### ** Examples

## No test: 
# Create a micomp object, use provided dataset
mic <- micomp(c("SheepPop", "WolfPop", "GrassQty"), 0.7,
              list(list(name = "NLOKvsJEXOK", grpout = pphpc_ok),
                   list(name = "NLOKvsJEXNOSHUFF", grpout = pphpc_noshuff),
                   list(name = "NLOKvsJEXDIFF", grpout = pphpc_diff)))

# Print the results (p-values) of the statistic tests evaluating the
# assumptions of the comparisons performed in the mic object
assumptions(mic)
## End(No test)



