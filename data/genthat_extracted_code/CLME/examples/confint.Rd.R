library(CLME)


### Name: confint.clme
### Title: Individual confidence intervals
### Aliases: confint.clme confint.summary.clme

### ** Examples


data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

confint( clme.out )





