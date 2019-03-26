library(micompr)


### Name: assumptions.micomp
### Title: Get assumptions for parametric tests performed on each
###   comparisons
### Aliases: assumptions.micomp

### ** Examples


# Create a micomp object, use provided dataset
mic <- micomp(6, 0.8,
              list(list(name = "NLOKvsJEXOK", grpout = pphpc_ok),
                   list(name = "NLOKvsJEXNOSHUFF", grpout = pphpc_noshuff),
                   list(name = "NLOKvsJEXDIFF", grpout = pphpc_diff)))

# Create an object containing the statistic tests evaluating the assumptions
# of the comparisons performed in the mic object
a <- assumptions(mic)




