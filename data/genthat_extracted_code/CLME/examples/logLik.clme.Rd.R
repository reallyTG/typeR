library(CLME)


### Name: logLik.clme
### Title: Log-likelihood
### Aliases: logLik.clme logLik.summary.clme

### ** Examples


data( rat.blood )
cons <- list(order = "simple", decreasing = FALSE, node = 1 )
clme.out <- clme(mcv ~ time + temp + sex + (1|id), data = rat.blood , 
                 constraints = cons, seed = 42, nsim = 0)

logLik( clme.out )




