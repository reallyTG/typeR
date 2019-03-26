library(CLME)


### Name: sigma.summary.clme
### Title: Residual variance components
### Aliases: sigma.summary.clme

### ** Examples


data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)
                 
sigma( clme.out )




