library(npregfast)


### Name: criticaldiff
### Title: Differences between the critical points for two factor's levels
### Aliases: criticaldiff

### ** Examples

library(npregfast)
data(barnacle)
fit2 <- frfast(DW ~ RC : F, data = barnacle, seed = 130853, nboot = 100) # with interactions
criticaldiff(fit2)
criticaldiff(fit2, der = 1)
criticaldiff(fit2, der = 1, level1 = "lens", level2 = "barca")




