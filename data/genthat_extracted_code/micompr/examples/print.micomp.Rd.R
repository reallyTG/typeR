library(micompr)


### Name: print.micomp
### Title: Print information about multiple comparisons of outputs
### Aliases: print.micomp

### ** Examples

## No test: 
# A micomp object from package datasets (i.e. grpoutputs objects) directly

micomp(c("outA", "outB", "outC", "outD"), 0.9,
              list(list(name = "Comp1", grpout = pphpc_ok),
                   list(name = "Comp2", grpout = pphpc_noshuff),
                   list(name = "Comp3", grpout = pphpc_diff)))
## End(No test)



