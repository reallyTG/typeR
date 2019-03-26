library(CLME)


### Name: ranef.clme
### Title: Extract random effects
### Aliases: ranef.clme ranef.summary.clme ranef.clme random.effects.clme

### ** Examples


data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

ranef( clme.out )





