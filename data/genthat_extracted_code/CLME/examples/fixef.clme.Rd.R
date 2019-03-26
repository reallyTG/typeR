library(CLME)


### Name: fixef.clme
### Title: Extract fixed effects
### Aliases: fixef.clme fixef.summary.clme fixef.clme fixed.effects
###   fixed.effects.summary.clme fixed.effects.clme coefficients.clme
###   coef.clme coefficients.summary.clme coef.summary.clme

### ** Examples


data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

fixef( clme.out )




