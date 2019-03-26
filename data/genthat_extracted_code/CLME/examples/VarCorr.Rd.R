library(CLME)


### Name: VarCorr
### Title: Variance components
### Aliases: VarCorr VarCorr.summary.clme VarCorr.clme

### ** Examples


data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)
                 
VarCorr( clme.out )






