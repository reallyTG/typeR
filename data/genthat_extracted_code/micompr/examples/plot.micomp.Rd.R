library(micompr)


### Name: plot.micomp
### Title: Plot projection of output observations on the first two
###   dimensions of the principal components space
### Aliases: plot.micomp

### ** Examples

## No test: 
plot(micomp(c("SheepPop", "WolfPop", "GrassQty"), 0.95,
            list(list(name = "I", grpout = pphpc_ok),
                 list(name = "II", grpout = pphpc_noshuff),
                 list(name = "III", grpout = pphpc_diff))))
## End(No test)



